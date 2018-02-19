ActiveAdmin.register Blog::Post do
  permit_params :title, :category_id, :content, :visible, :visible_at
  menu priority: 6

  form do |f|
    inputs do
      input :category, as: :select, values: Blog::Category.all, include_blank: 'Select one'
      input :title
      input :content
      input :visible_at, as: :datepicker
      input :visible, as: :boolean
    end
    unless f.object.new_record?
      panel 'Post info' do
        ul do
          li "Total views: #{@resource.views}"
          li "Slug: #{@resource.slug}"
        end
      end
    end
    actions
  end

  index do
    column :title do |post|
      link_to post.title, post_path(id: post.slug, category: post.category)
    end
    column :category do |post|
      post.category.title.truncate(25)
    end
    column :views
    column :visible
    column :visible_at
    column :created_at
    actions
  end
end
