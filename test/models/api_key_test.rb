# == Schema Information
#
# Table name: api_keys
#
#  id           :integer          not null, primary key
#  access_token :string(255)
#  expires_at   :datetime
#  user_id      :integer
#  active       :boolean
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class ApiKeyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
