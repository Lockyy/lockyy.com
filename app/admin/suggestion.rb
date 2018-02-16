ActiveAdmin.register Suggestion, as: 'Suggestions' do
  config.sort_order = 'created_at_desc'

  show do |_section|
    attributes_table do
      row :id
      row :suggestion
      row :email, &:suggester_email
      row :done
      row :good
      column :created_at
    end
  end

  index do |_section|
    column :id
    column :suggestion
    column :email, &:suggester_email
    column :done
    column :good
    column :created_at
    actions
  end
end
