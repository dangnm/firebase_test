# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default("")
#  encrypted_password     :string(255)      default(""), not null
#  phone_number           :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  encrypted_pin_code     :string(255)      default(""), not null
#

FactoryGirl.define do
  factory :user do
    phone_number Faker::PhoneNumber.cell_phone
    # sequence :phone_number do |n|
    #   "12345678{n}"
    # end
    password '12345678'
    password_confirmation '12345678'

    callback(:after_build) do |user|
      user.apply_validation_policy User::TwilioEmailValidationPolicy
      user.apply_validation_policy User::NewUserNotificationPolicy
    end
    
  end
end
