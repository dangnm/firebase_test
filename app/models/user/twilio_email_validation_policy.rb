class User < ActiveRecord::Base
  module TwilioEmailValidationPolicy
    def self.included(base)
      base.extend ClassMethods
      base.class_eval do
        validate :validate_email_policy, :on => :create
      end
    end

    def validate_email_policy
      if self.errors.size == 0 
        begin
          TwilioWrapper::Client.send_pin_code_sms(self.phone_number, self.pin_code)
        rescue => e
          self.errors.add(:phone_number, "The phone number is invalid")
          Rails.logger.error e.message
        end 
      end
    end

    module ClassMethods
      
    end
  end
end