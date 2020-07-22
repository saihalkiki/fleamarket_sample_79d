class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :explanation, null: false
      t.string :quality, null: false
      t.integer :delivery_cost, null: false
      t.string :region, null: false
      t.integer :period, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
