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
