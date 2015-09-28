class FirebaseWrapper::Client
  def self.send_created_user_notification(phone_number)
    begin
      generator = Firebase::FirebaseTokenGenerator.new(ENV['FIREBASE_SECRET'])
      payload = {:uid => "1"}
      token = generator.create_token(payload)
      base_uri = ENV['FIREBASE_URI']
      firebase = Firebase::Client.new(base_uri, token)
      response = firebase.push(NEW_USER_NOTIFICATION, {
        phone_number: phone_number,
        created_at: Time.current
      })
    rescue => e
      Rails.logger.error e.message
    end
  end
end