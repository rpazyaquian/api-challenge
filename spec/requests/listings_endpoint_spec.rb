require "rails_helper"

RSpec.describe "Listings endpoint", :type => :request do
  describe "/index" do
    describe "GET" do
      let!(:listing) do
        FactoryGirl.create(:listing)
      end
      it "shows all listings" do
        get "/listings"
        expect(JSON.parse(response.body).length).to eq 1
      end
    end
    describe "POST" do
      let(:listing_attrs) do
        FactoryGirl.attributes_for(:listing)
      end
      it "creates a new listing" do |variable|
        post "/listings", params: { listing: listing_attrs }
        expect(response).to be_success
      end
    end
  end

  describe "prompt requirements" do

    # Given that we have one Listing,
    # with one Photo, which has one Image, which has one Thumb,
    # and three tags, in an array...

    let(:listing_attrs) do
      {
        uuid: "BoxStore123",
        active: true,
        name: "NewBoxStoreBoston",
        email: "boxstore@boxstore.net",
        description: "lots of information goes here!",
        address: "524 Harrison Ave",
        city: "Boston",
        state: "MA",
        zipcode: "23462",
        lat: "40.7143528",
        lng: "-74.0059731",
        phone_number: "6179557522"
      }
    end

    let!(:listing) do
      Listing.create(listing_attrs)
    end

    let(:photo_attrs) do
      {
        uuid: "902348586",
        interest_point_id: 850924880,
        name: "rsz_facefull.png",
        listing_id: listing.id
      }
    end

    let!(:photo) do
      Photo.create(photo_attrs)
    end

    let(:image_attrs) do
      {
        url: "/uploads/photo/image/902348586/rsz_facefull.png",
        photo_id: photo.id
      }
    end

    let!(:image) do
      Image.create(image_attrs)
    end

    let(:thumb_attrs) do
      {
        url: "/uploads/photo/image/902348586/thumb_rsz_facefull.png",
        image_id: image.id
      }
    end

    let!(:thumb) do
      Thumb.create(thumb_attrs)
    end

    let!(:tags) do
      tag_attrs = [
        {
          label: "tag1"
        },
        {
          label: "tag2"
        },
        {
          label: "tag3"
        }
      ]
      tag_attrs.map { |attrs| Tag.create(attrs) }
    end

    let!(:tag_associations) do
      tags.map do |tag|
        TagAssociation.create({
          listing_id: listing.id,
          tag_id: tag.id
        })
      end
    end

    context "/listing/index" do
      describe "GET" do
        it "returns a specific array of listings" do
          get "/listings"
          json_response = JSON.parse(response.body)

          listing = json_response[0].deep_symbolize_keys
          photo = listing[:photo]
          image = photo[:image]
          thumb = image[:thumb]
          tag_list = listing[:tag_list]

          expect(listing).to include(listing_attrs)
          expect(photo).to include(photo_attrs.except(:listing_id))
          expect(image).to include(image_attrs.except(:photo_id))
          expect(thumb).to include(thumb_attrs.except(:image_id))
          expect(tag_list).to match(["tag1", "tag2", "tag3"])
        end
      end
      describe "POST" do
        let(:new_listing_attrs) do
          FactoryGirl.attributes_for(:listing)
        end
        it "adds a listing to the array of listings" do
          post "/listings", listing: new_listing_attrs
          json_response = JSON.parse(response.body)

          expect(json_response.length).to eq 2
        end
      end
    end
    context "/listing/:listing_id" do
      describe "GET" do
        it "returns a specific listing" do
          get "/listings/#{listing.id}"
          listing = JSON.parse(response.body).deep_symbolize_keys

          expect(listing).to include(listing_attrs)
        end
      end
      describe "PUT" do
        it "updates a specific listing" do
          post "/listings/#{listing.id}", name: "hello world"
          listing = JSON.parse(response.body).deep_symbolize_keys

          expect(listing[:name]).to be "hello world"
        end
      end
    end
  end
end
