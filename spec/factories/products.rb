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

FactoryGirl.define do
  factory :product do
    name "MyString"
    description "MyString"

    callback(:after_build) do |product|
      product.apply_custom_policy Product::NewProductNotificationPolicy
    end

  end

end
