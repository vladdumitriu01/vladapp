class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, info: 'Logged in successfully!'
    else
      flash.now[:danger] = 'Invalid email or password'
      render 'new'
    end
  end


  def destroy
    session[:user_id] = nil
    redirect_to root_path, info: 'Logged out!'
  end
end