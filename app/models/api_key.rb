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

class ApiKey < ActiveRecord::Base
  before_create :generate_access_token
  before_create :set_expiration
  belongs_to :user

  def expired?
    DateTime.now >= self.expires_at
  end


  def self.get(user_id)
    key = ApiKey.find_by_user_id(user_id)

    if !key || key.expired?
      key.destroy if key
      key = ApiKey.create(:user_id => user_id)
    end

    return key
  end


  private
  def generate_access_token
    begin
      self.access_token = SecureRandom.hex
    end while self.class.exists?(access_token: access_token)
  end

  def set_expiration
    self.expires_at = 1.hour.from_now
  end
end
