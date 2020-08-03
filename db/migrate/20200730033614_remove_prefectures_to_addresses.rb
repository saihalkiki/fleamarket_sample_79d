class RemovePrefecturesToAddresses < ActiveRecord::Migration[6.0]
  def change
    remove_column :addresses, :prefectures, :string
  end
end
