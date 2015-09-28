module V1

  module AuthHelpers

    def current_user
      # find token. Check if valid.
      user_token = headers['Authorization'].presence || headers['Token'].presence || params[:token]
      token = ApiKey.where(:access_token => user_token).first

      if token && !token.expired?
        user = User.find(token.user_id)
        @current_user = user
      else
        error!('Unauthorized', 401)
      end
    end
    
    def authenticate!
      current_user unless @current_user
    end

  end

end
