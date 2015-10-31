require "rails_helper"

RSpec.describe "Listings endpoint", :type => :request do
  describe "/index" do
    let!(:listing) do
      FactoryGirl.create(:listing)
    end
    it "shows all listings" do
      get "/listings"
      puts response.body
      expect(response).to be_success
    end
  end
end