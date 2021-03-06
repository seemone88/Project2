class PostsController < ApplicationController

  def index
    @posts = current_user.posts
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to user_path(@post.user)
    else
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id])
    @posts = Post.all

  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to :back
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_path
  end
  private
  def post_params
    params.require(:post).permit(:body, :user_id, :post_id, :title, :picture)
  end
end
