# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Product < ActiveRecord::Base
  include CustomPolicy
  
  def self.build_product(opts={})
    product = Product.new
    product.name = opts[:name]
    product.description = opts[:description]
    return product
  end
end
