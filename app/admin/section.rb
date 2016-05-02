ActiveAdmin.register Section, as: 'Portfolio Section' do

 permit_params :section_id, :name, :description, :position

  show do |section|
    attributes_table do
      row :id
      row :name
      row :description
      row :total_items do |section|
        section.items.length
      end
    end

    panel 'Items' do
      table_for section.items do
        column :id
        column :name
        column :slug
        column :position
        column '' do |item|
          link_to 'View', admin_portfolio_item_path(id: item.id)
        end
        column '' do |item|
          link_to 'Edit', edit_admin_portfolio_item_path(id: item.id)
        end
      end
    end
  end

end
