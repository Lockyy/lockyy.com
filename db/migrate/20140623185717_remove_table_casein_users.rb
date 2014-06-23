class RemoveTableCaseinUsers < ActiveRecord::Migration
  def change
    drop_table :casein_users
  end
end
