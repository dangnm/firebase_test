class User < ActiveRecord::Base
  module NewUserNotificationPolicy
    
    def self.included(base)
      base.class_eval do
        before_create :created_user_notification_policy
      end
    end

    def created_user_notification_policy
      FirebaseWrapper::Client.send_created_user_notification(self.phone_number)
    end

  end
end
