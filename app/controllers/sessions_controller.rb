class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if user
      login(user)
      session[:session_token] = user.reset_session_token!
      render json: "signed in"
    else
      flash[:errors] = ['Invalid credentials']
      render :new
    end

  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end

  private
  def session_params
    params.require(:user).permit(:email, :password)
  end
end
