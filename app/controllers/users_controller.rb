class UsersController < ApplicationController
  def destroy
    user = User.find(params[:id])
    if !user.is_admin?
      user.destroy
      render :json => {
        message: "Successfully"
      }, :status => 200
    else
      render :json => {
        message: "Unsuccessfully! User is an admin"
      }, :status => 400
    end
  end
end
