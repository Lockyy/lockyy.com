# frozen_string_literal: true

class BlogController < ApplicationController
  def index
    @posts = posts(params[:category]).order(created_at: :desc)
  end

  def show
    @post = Blog::Post.visible.friendly.find(params[:id])
    handle_view

    new_url_redirect if slug_changed?
  end

  private

  def handle_view
    @post.increment!(:views) if view_incrementable?
    session[session_key] = Time.zone.now
  end

  def session_key
    "viewed_#{@post.id}"
  end

  def view_incrementable?
    current_admin_user.blank? && !recently_viewed?
  end

  def recently_viewed?
    session[session_key].present? && session[session_key] > Time.zone.now - 5.seconds
  end

  def posts(category_slug)
    return Blog::Post.visible unless category_slug

    category = Blog::Category.friendly.find(category_slug)
    category.posts.visible
  end

  def slug_changed?
    request.path != post_path(@post.category, @post)
  end

  def new_url_redirect
    redirect_to post_path(@post.category, @post), status: :moved_permanently
  end
end
