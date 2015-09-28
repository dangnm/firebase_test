# class SessionsController < Devise::SessionsController
#     def create
#         build_resource
#         resource = User.find_for_database_authentication(:phone_number => params[:phone_number])
#         return invalid_login_attempt unless resource

#         if resource.valid_pin_code?(params[:pin_code])
#             #resource.ensure_authentication_token!  #make sure the user has a token generated
#             sign_in("user", resource)
#             render :json => { :authentication_token => resource.authentication_token, :lastname => resource.lastname, :firstname => resource.firstname, :last_sign_in => resource.last_sign_in_at }, :status => :created
#         return
#         end
#         invalid_login_attempt
#     end
# end