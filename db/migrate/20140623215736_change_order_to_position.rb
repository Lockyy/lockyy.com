class ChangeOrderToPosition < ActiveRecord::Migration
  def change
    rename_column :bios, :order, :position
    rename_column :items, :order, :position
    rename_column :sections, :order, :position
  end
end
