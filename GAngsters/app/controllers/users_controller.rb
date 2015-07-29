class UsersController < ApplicationController
  before_action :authorize, only: :index
  def index
    @users = User.all
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :birthday)
  end
end
