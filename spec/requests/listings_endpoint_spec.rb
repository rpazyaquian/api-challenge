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

    let!(:listing) do
      listing_attrs = {
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
      Listing.create(listing_attrs)
    end

    let!(:photo) do
      photo_attrs = {
        uuid: "902348586",
        interest_point_id: 850924880,
        name: "rsz_facefull.png",
        listing: listing
      }
      Photo.create(photo_attrs)
    end

    let!(:image) do
      image_attrs = {
        url: "/uploads/photo/image/902348586/rsz_facefull.png",
        photo: photo
      }
      Image.create(image_attrs)
    end

    let!(:thumb) do
      thumb_attrs = {
        url: "/uploads/photo/image/902348586/thumb_rsz_facefull.png",
        image: image
      }
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
          listing: listing,
          tag: tag
        })
      end
    end

    context "/listing/index" do
      describe "GET" do
        it "returns a specific array of listings"
      end
      describe "POST" do
        it "adds a listing to the array of listings"
      end
    end
    context "/listing/:listing_id" do
      describe "GET" do
        it "returns a specific listing"
      end
      describe "PUT" do
        it "updates a specific listing"
      end
    end
  end
end
