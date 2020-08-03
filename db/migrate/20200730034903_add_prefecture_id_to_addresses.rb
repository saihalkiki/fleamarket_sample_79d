class AddPrefectureIdToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :prefecture_id, :integer, null: false
  end
end
