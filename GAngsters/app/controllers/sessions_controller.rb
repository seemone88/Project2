class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to new_post_path, notice: "Welcome OG Triple OG"
    else
      flash.now.alert = "WRONG SUCKA"
      render 'new'
    end
  end

  def destroy
   session[:user_id] = nil
   redirect_to root_url, notice: "Dueces homeboy"
  end
end
