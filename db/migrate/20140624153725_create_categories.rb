class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.string :slug

      t.timestamps
    end

    add_index :categories, :slug
  end
end
