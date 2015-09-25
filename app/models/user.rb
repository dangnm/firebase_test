class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of :phone_number

  # before_create :validate_email
  validate :validate_email, :on => :create

  def email_required?
    false
  end

  def validate_email
    begin
      @client = Twilio::REST::Client.new
      @client.messages.create(
        from: ENV['TWILIO_NUMBER'],
        to: self.phone_number,
        body: "Your key is #{self.password}"
      )
    rescue => e
      self.errors.add(:phone_number, "The phone number is invalid")
      Rails.logger.error e.message
    end
  end
end
