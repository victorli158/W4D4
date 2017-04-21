class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      render json: "created"
    else
      render json: "failed"
    end
  end

  def show
    current_user
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end
