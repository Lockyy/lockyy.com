class BlogController < ApplicationController
  def index
    @posts = posts(params[:category])
  end

  def show
    @post = Blog::Post.friendly.find(params[:id])

    if @post && @post.visible?
      @post.log_visit
      if request.path != post_path(@post.category, @post)
        redirect_to post_path(@post.category, @post), status: :moved_permanently
      end
    end
  end

  private

  def posts(_category_slug)
    if params[:category]
      category = Blog::Category.friendly.find(params[:category])
      return category.posts.visible
    end
    Blog::Post.visible
  end
end
