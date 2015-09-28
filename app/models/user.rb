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

require "firebase_token_generator"
require 'bcrypt'

class User < ActiveRecord::Base
  include ValidationPolicy
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of :phone_number
  
  def self.build_user(opts={})
    if(opts[:phone_number])
      user = User.new
      user.phone_number = opts[:phone_number]
      user.password = opts[:password]
      user.pin_code = opts[:pin_code]
      return user
    end
    nil
  end

  def self.generate_password
    rand.to_s[2..9]
  end

  def self.generate_pin_code
    rand.to_s[2..5]
  end

  def pin_code=(code)
    self.encrypted_pin_code = BCrypt::Password.create(code)
    @pin_code = code
  end

  def pin_code
    @pin_code
  end

  def valid_pin_code?(code)
    BCrypt::Password.new(self.encrypted_pin_code) == code
  end

  def email_required?
    false
  end
  
end
