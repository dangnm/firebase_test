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
#  role                   :string(255)
#

# # == Schema Information
# #
# # Table name: users
# #
# #  id                     :integer          not null, primary key
# #  email                  :string(255)      default("")
# #  encrypted_password     :string(255)      default(""), not null
# #  phone_number           :string(255)      default(""), not null
# #  reset_password_token   :string(255)
# #  reset_password_sent_at :datetime
# #  remember_created_at    :datetime
# #  sign_in_count          :integer          default(0), not null
# #  current_sign_in_at     :datetime
# #  last_sign_in_at        :datetime
# #  current_sign_in_ip     :inet
# #  last_sign_in_ip        :inet
# #  created_at             :datetime         not null
# #  updated_at             :datetime         not null
# #  encrypted_pin_code     :string(255)      default(""), not null
# #

# require 'rails_helper'

# RSpec.describe User, type: :model do
#   describe '#user_test' do
#     let!(:user) { create(:user)}
#     it "test" do
#       expect(User.count).to eq(1)
#     end 
#   end
# end
