ActiveAdmin.register Suggestion, as: 'Suggestions' do
  config.sort_order = 'created_at_desc'
  menu priority: 7

  permit_params :done, :good

  show do |_section|
    attributes_table do
      row :id
      row :suggestion
      row :email
      row :done
      row :good
      row :created_at
    end
  end

  index do |_section|
    column :id
    column :suggestion
    column :email
    column :done
    column :good
    column :created_at
    actions
  end

  form do |_f|
    panel 'Suggestion' do
      dl do
        dt 'Email'
        dd @resource.email
        dt 'Suggestion'
        dd @resource.suggestion
      end
    end

    inputs do
      input :done
      input :good
    end

    actions
  end
end
