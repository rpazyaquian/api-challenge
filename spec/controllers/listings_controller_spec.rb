require 'rails_helper'

RSpec.describe ListingsController, :type => :controller do
  describe '#index' do
    let(:listing) do
      FactoryGirl.build_stubbed(:listing)
    end
    it "lists all listings" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
