module V1

  class ProductsApi < Grape::API
    params do
      optional :token, :type => String, :desc => "Access token"
    end
    resource :products do
      desc "Create new product"
      params do
        requires :name, :type => String, :desc => "name"
        requires :description, :type => String, :desc => "description"
      end
      post do
        product = Product.build_product({
                                  :name => params[:name],
                                  :description => params[:description]
                                });
        product.apply_custom_policy Product::NewProductNotificationPolicy
        product.save
        return {
          id: product.id
        }
      end
    end # end resource

  end

end
