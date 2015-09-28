module V1

  class UsersApi < Grape::API
    params do
      optional :token, :type => String, :desc => "Access token"
    end
    resource :users do
      desc "Create new user"
      params do
        requires :phone_number, :type => String, :desc => "Phone number"
      end
      post do
        user = User.build_user({
                                  :phone_number => params[:phone_number],
                                  :password => User.generate_password,
                                  :pin_code => User.generate_pin_code
                                });
        user.apply_custom_policy User::TwilioEmailValidationPolicy
        user.apply_custom_policy User::NewUserNotificationPolicy
        user.save
        return {
          id: user.id
        }
      end
    end # end resource

  end

end
