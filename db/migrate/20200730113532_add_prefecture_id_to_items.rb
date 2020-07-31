class AddPrefectureIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :prefecture_id, :integer, null: false
  end
end
