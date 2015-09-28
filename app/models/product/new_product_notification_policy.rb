class Product < ActiveRecord::Base
  module NewProductNotificationPolicy
    def self.included(base)
      base.class_eval do
        before_create :created_product_notification_policy
      end
    end

    def created_product_notification_policy
      FirebaseWrapper::Client.send_created_product_notification(self.id, self.name, self.description)
    end

  end
end
