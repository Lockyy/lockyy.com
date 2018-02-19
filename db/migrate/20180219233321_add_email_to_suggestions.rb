class AddEmailToSuggestions < ActiveRecord::Migration
  def change
    add_column :suggestions, :email, :string
    remove_column :suggestions, :email_id, :integer
  end
end
