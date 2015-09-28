require 'rails_helper'

RSpec.describe "Products API", :type => :api do
  describe "POST /api/v1/products" do
    before do
      expect(FirebaseWrapper::Client).to receive(:send_created_product_notification).with(anything,"iPhone","Gen 5")

      @url = "/api/v1/products"
      post @url, {
        :name => "iPhone",
        :description => "Gen 5"
      }
    end

    it "should be added successfully" do
      response_hash = JSON.parse(response.body)
      puts response_hash.inspect
      expect(response_hash["id"]).not_to be_nil
    end
  end
end