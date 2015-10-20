class PostsController < ApplicationController
  before_action :get_posts, :except => [:show]
  before_action :authenticate_user!, :only => [:create, :new, :destroy, :edit, :update]

  def index

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end


private
  def post_params
    params.require(:post).permit(:title, :body, :author)
  end

  def get_posts
    @posts = Post.all
  end

end
