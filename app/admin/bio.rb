ActiveAdmin.register Bio, as: 'Landing Message' do

  permit_params :content

  index do
    column :content
    actions
  end

  show do |bio|
    panel 'Landing page content' do
      div bio.content
    end
  end

end
