class AddPathToSuggestions < ActiveRecord::Migration
  def change
    add_column :suggestions, :path, :string
  end
end
