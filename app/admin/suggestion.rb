ActiveAdmin.register Suggestion, as: 'Suggestions' do
  config.sort_order = 'created_at_desc'

  show do |section|
    attributes_table do
      row :id
      row :suggestion
      row :email do |suggestion|
        suggestion.suggester_email
      end
      row :done
      row :good
    column :created_at
    end
  end

  index do |section|
    column :id
    column :suggestion
    column :email do |suggestion|
      suggestion.suggester_email
    end
    column :done
    column :good
    column :created_at
    actions
  end

end
