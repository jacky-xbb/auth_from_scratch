class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
    if user
      session[:user_id] = user.id
      flash[:notice] = "Welcome #{user.email}"
      redirect_to root_path
    else
      flash[:alert] = 'Invalid email or password'
      redirect_to sign_in_path
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'You have been signed out'
    redirect_to root_path
  end
end
