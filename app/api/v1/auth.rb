module V1

  class Auth < Grape::API

    # for testing by backbend dev
    resource :auth do

      desc "Creates and returns access_token if valid login"
      params do
        requires :phone_number, :type => String, :desc => "Phone number"
        requires :pin_code, :type => String, :desc => "Password"
      end
      post :login do
        user = User.find_by_phone_number(params[:phone_number].downcase)

        if user && user.valid_pin_code?(params[:pin_code])
          key = ApiKey.create(:user_id => user.id)
          {:token => key.access_token}
        else
          error!('Unauthorized.', 401)
        end
      end

      desc "Returns pong if logged in correctly"
      params do
        requires :token, :type => String, :desc => "Access token."
      end
      get :ping do
        authenticate!
        {:message => "pong"}
      end

    end

  end

end