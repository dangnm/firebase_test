require "spec_helper"

describe "Auth API", :type => :api do
  describe "POST /api/v1/auth/login" do
    before do 
      expect(TwilioWrapper::Client).to receive(:send_pin_code_sms).with("+849057799191", anything)
      expect(FirebaseWrapper::Client).to receive(:send_created_user_notification).with(anything, "+849057799191", anything)
    end
    let!(:user) { create(:user, :phone_number => "+849057799191", :pin_code => "1234") }
    before do 
      @url = "/api/v1/auth/login"
      post @url, {
        :phone_number => "+849057799191",
        :pin_code => "1234"
      }
    end

    it "should be added successfully" do
      response_hash = JSON.parse(response.body)
      puts response_hash
      expect(response_hash["token"]).not_to be_nil

    end
  end
end