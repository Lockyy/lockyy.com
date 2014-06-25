class BlogController < ApplicationController
  
  def index
    if params[:category]
      @posts = BlogPost.category_find(params[:category])
    else
      @posts = BlogPost.all
    end
  end

  def show
  	@post = BlogPost.find_by(id: params[:id])

    if @post
      @post.log_visit
    else
      redirect_to posts_path
    end
  end

end
