class ChangeDatatypePhoneNumberOfAddresses < ActiveRecord::Migration[6.0]
  def change
    change_column :addresses, :phone_number, :string
  end
end
