class AddDetailsToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :purchaser_id, :integer
  end
end
