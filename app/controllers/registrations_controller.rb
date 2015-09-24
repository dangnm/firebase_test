class RegistrationsController < Devise::RegistrationsController
  def create
    super
  end

  def build_resource(hash=nil)
    super
    self.resource.password = "ab12cd12";
    self.resource.password_confirmation = "ab12cd12";
  end

end
