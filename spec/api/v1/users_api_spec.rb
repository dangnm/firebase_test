require "spec_helper"

describe "Users API", :type => :api do
  describe "POST /api/v1/users" do
    before do
      expect(TwilioWrapper::Client).to receive(:send_pin_code_sms).with("+84905779919", anything)
      expect(FirebaseWrapper::Client).to receive(:send_created_user_notification).with("+84905779919")

      @url = "/api/v1/users"
      post @url, {
        :phone_number => "+84905779919"
      }
    end

    it "should be added successfully" do
      # @user = create(:user) 
      response_hash = JSON.parse(response.body)
      expect(response_hash["id"]).not_to be_nil

    end
  end
end