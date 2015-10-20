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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

private
  def post_params
    params.require(:post).permit(:title, :body, :author)
  end

  def get_posts
    @posts = Post.all
  end

end
