class PasswordResetsController < ApplicationController
  before_action :get_user, only: %i[edit update]
  def new; end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:notice] = 'Email sent with password reset instructions'
      redirect_to root_path
    else
      flash.now[:alert] = 'Email address not found'
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @user.password_reset_expired?
      flash[:alert] = 'Password reset has expired'
      redirect_to new_password_reset_url
    elsif @user.update(user_params)
      flash[:notice] = 'Password has been reset'
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :reset_token)
  end

  def get_user
    @user = User.find_by(reset_token: params[:id])
  end
end
