class AddEncryptedPinCodeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :encrypted_pin_code, :string, null: false, default: ""
  end
end
