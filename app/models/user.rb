class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of :phone_number

  before_create :created_user_notification
  validate :validate_email, :on => :create

  NEW_USER_NOTIFICATION = "last_created_user"

  def email_required?
    false
  end

  def created_user_notification
    begin
      base_uri = ENV['FIREBASE_URI']
      firebase = Firebase::Client.new(base_uri)
      response = firebase.push(NEW_USER_NOTIFICATION, {
        phone_number: self.phone_number,
        created_at: Time.current
      })
    rescue => e
      Rails.logger.error e.message
    end
  end

  def validate_email
    begin
      if self.errors.size == 0 
        @client = Twilio::REST::Client.new
        @client.messages.create(
          from: ENV['TWILIO_NUMBER'],
          to: self.phone_number,
          body: "Your key is #{self.password}"
        )
      end
    rescue => e
      self.errors.add(:phone_number, "The phone number is invalid")
      Rails.logger.error e.message
    end
  end
end
