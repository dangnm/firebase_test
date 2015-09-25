class RegistrationsController < Devise::RegistrationsController
  def create
    super
  end

  def build_resource(hash=nil)
    super
    if hash != nil && !hash.empty?
      password = "ab12cd12"
      self.resource.password = password;
      self.resource.password_confirmation = password;
    end
    
  end

end
