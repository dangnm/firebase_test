class User < ActiveRecord::Base
  module NewUserNotificationPolicy
    
    def self.included(base)
      base.class_eval do
        after_create :created_user_notification_policy
      end
    end

    def created_user_notification_policy
      FirebaseWrapper::Client.send_created_user_notification(self.id, self.phone_number, self.created_at)
    end

  end
end
