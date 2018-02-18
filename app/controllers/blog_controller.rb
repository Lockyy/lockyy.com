class BlogController < ApplicationController
  def index
    @posts = posts(params[:category]).order(created_at: :desc)
  end

  def show
    @post = Blog::Post.visible.friendly.find(params[:id])
    @post.log_visit

    check_for_changed_slug
  end

  private

  def posts(category_slug)
    return Blog::Post.visible unless category_slug

    category = Blog::Category.friendly.find(category_slug)
    category.posts.visible
  end

  def check_for_changed_slug
    return if request.path == post_path(@post.category, @post)

    redirect_to post_path(@post.category, @post), status: :moved_permanently
  end
end
