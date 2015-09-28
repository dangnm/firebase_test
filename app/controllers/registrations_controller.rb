class RegistrationsController < Devise::RegistrationsController
  def create
    super
  end

  def build_resource(hash=nil)
    super
    if hash != nil && !hash.empty?
      password = User.generate_password
      self.resource.password = password;
      self.resource.password_confirmation = password;
      self.resource.pin_code = User.generate_pin_code;
      self.resource.apply_custom_policy User::TwilioEmailValidationPolicy
      self.resource.apply_custom_policy User::NewUserNotificationPolicy
    end
    
  end

end
