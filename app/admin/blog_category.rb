ActiveAdmin.register Blog::Category do
  permit_params :title

  form do |f|
    inputs do
      input :title
    end
    panel 'Category info' do
      ul do
        li "Total posts: #{@resource.posts.length}"
        li "Slug: #{@resource.slug}"
      end
    end unless f.object.new_record?
    actions
  end

  index do
    column :title do |category|
      link_to category.title, post_category_path(category: category)
    end
    column :total_views do |category|
      category.posts.inject(0) { |i, post| i += post.views }
    end
    column :total_posts do |category|
      category.posts.length
    end
    actions
  end

  show do |category|
    attributes_table do
      row :id
      row :title
      row :slug
      row :total_posts do |category|
        category.posts.length
      end
    end

    panel 'Posts' do
      table_for category.posts do
        column :title do |post|
          link_to post.title, post_path(id: post.slug, category: post.category)
        end
        column :slug
        column :views
        column '' do |post|
          link_to 'View', admin_blog_post_path(id: post.slug)
        end
        column '' do |post|
          link_to 'Edit', edit_admin_blog_post_path(id: post.slug)
        end
      end
    end
  end
end
