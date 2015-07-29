class PostsController < ApplicationController
  before_action :authorize, only: :destroy
  def index
    @posts = current_user.posts
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to posts_path
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
    render 'new'
  end
  private
  def post_params
    params.require(:post).permit(:body, :user_id)
  end
end
