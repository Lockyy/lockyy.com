ActiveAdmin.register Bio, as: 'Landing Message' do

  permit_params :content

  index do
    column :content
    actions
  end

  show do
    panel 'Landing page content' do
      div :content
    end
  end

end
