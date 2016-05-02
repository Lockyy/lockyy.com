class BlogController < ApplicationController
  def index
    @posts = posts(params[:category])
  end

  def show
    @post = Blog::Post.friendly.find_by(slug: params[:id])

    if @post && @post.visible?
      @post.log_visit
      if request.path != post_path(@post.category, @post)
        redirect_to post_path(@post.category, @post), status: :moved_permanently
      end
    end
  end

  private

  def posts(category_slug)
    if params[:category]
      category = Blog::Category.friendly.find_by(slug: params[:category])
      return category.posts.visible
    end
    Blog::Post.visible
  end
end
