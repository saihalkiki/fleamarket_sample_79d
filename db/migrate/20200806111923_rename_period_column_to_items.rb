class RenamePeriodColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :period, :period_id
  end
end
