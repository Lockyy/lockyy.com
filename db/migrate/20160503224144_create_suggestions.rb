class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.integer :email_id
      t.string  :suggestion
      t.boolean :done, default: false
      t.boolean :good

      t.timestamps null: false
    end
  end
end
