class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @post.comments.new(comment_params)

    if @post.save
      redirect_to post_path(@post)
    else
    end
  end

private

  def comment_params
    params.require("comment").permit(:author, :body)
  end

end
