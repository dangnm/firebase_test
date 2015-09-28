class TwilioWrapper::Client
  def self.send_pin_code_sms(phone_number, pin_code)
    begin
      @client = Twilio::REST::Client.new
      @client.messages.create(
        from: ENV['TWILIO_NUMBER'],
        to: phone_number,
        body: "Your key is #{pin_code}"
      )
    rescue => e
      raise e
    end
  end
end