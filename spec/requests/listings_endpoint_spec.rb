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
end
