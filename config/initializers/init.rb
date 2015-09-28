Warden::Strategies.add(:pin_code_login) do 
  def valid?  
    params["action"] == "create" && 
    params["controller"] == "devise/sessions" && 
    params["user"]["phone_number"] &&
    params["user"]['pin_code']
  end 

  def authenticate! 
    resource = User.find_by_phone_number(params["user"]["phone_number"])
    if resource.valid_pin_code?(params["user"]['pin_code'])
      success!(resource)
    else
      fail!(message)
    end
  end 
end 