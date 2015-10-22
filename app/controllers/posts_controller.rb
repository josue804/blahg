class PostsController < ApplicationController
  before_action :get_posts, :except => [:show]
  before_action :authenticate_user!, :only => [:create, :new, :destroy, :edit, :update, :show]

  def index

  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    tags = tag_params[:name].split(" ")
    if @post.save
      tags.each do |tag|
        tag_name = Tag.find_or_create_by(name: tag)
        @post.tags.push(tag_name)
      end
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
    params.permit(:title, :body, :author)
  end

  def tag_params
    params.permit(:name)
  end

  def get_posts
    @posts = Post.all
  end

end
