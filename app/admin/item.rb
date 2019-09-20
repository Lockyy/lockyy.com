# frozen_string_literal: true

ActiveAdmin.register Item, as: 'Portfolio Item' do
  permit_params :name, :section_id, :content, :link, :position
  menu priority: 4
end
