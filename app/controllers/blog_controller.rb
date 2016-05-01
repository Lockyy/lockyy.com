class BlogController < ApplicationController
  def index
    @posts = if params[:category]
               BlogPost.category_find(params[:category])
             else
               BlogPost.viewable
             end
  end

  def show
    @post = BlogPost.friendly.find_by_slug(params[:id])

    if @post && @post.viewable?
      @post.log_visit
      if request.path != post_path(@post.blog_category, @post)
        redirect_to post_path(@post.blog_category, @post), status: :moved_permanently
      end
    end
  end
end
