class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(create_params)

    return unless @user.save

    flash[:notice] = "Welcome #{@user.email}"
    redirect_to root_path
  end

  private

  def create_params
    params.require(:user).permit(:email, :password)
  end
end
