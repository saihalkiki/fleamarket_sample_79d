class AddDetailToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :first_name, :string
    add_column :addresses, :last_name, :string
    add_column :addresses, :first_name_read, :string
    add_column :addresses, :last_name_read, :string
  end
end
