ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    columns do
      column do
        panel "Recent Posts" do
          ul do
            Blog::Post.recent(5).map do |post|
              li do
                "#{link_to(post.title, post_path(id: post.slug, category: post.category.slug))} -
                 #{post.views} views -
                 #{link_to('view', admin_blog_post_path(post))}
                 #{link_to('edit', edit_admin_blog_post_path(post))}".html_safe
              end
            end
          end
        end
      end

      column do
        panel "Most Viewed Posts" do
          ul do
            Blog::Post.most_viewed.first(5).map do |post|
              li do
                "#{link_to(post.title, post_path(id: post.slug, category: post.category.slug))} -
                 #{post.views} views -
                 #{link_to('view', admin_blog_post_path(post))}
                 #{link_to('edit', edit_admin_blog_post_path(post))}".html_safe
              end
            end
          end
        end
      end
    end
  end # content
end
