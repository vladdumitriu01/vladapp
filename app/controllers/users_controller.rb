class UsersController < ApplicationController
  attr_accessor :bambeuro
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.bambeuro = 100
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, info: 'Registration successful!'
    else
      flash[:danger] = @user.errors.full_messages.join(', ')
      redirect_to signup_path
    end
  end

  def about
    @user = current_user
    render 'about'
  end

  def payment_info
    @user = current_user
    render 'payment_info'
  end



  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
