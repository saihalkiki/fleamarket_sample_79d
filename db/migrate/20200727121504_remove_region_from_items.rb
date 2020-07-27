class RemoveRegionFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :region, :string, null: false
  end
end
