class AdminController < ApplicationController
  def users
    @users = User.all.order(created_at: :desc)
  end

  def products
    @products = Product.all.order(created_at: :desc)
  end
end
