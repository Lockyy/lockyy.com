ActiveAdmin.register Item, as: 'Portfolio Item' do
  permit_params :name, :section_id, :content, :link, :position
end
