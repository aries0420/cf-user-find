class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
    @user.build_license
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User has been saved."
      redirect_to users_url
    else
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, licence_attributes: [:number, :state])
  end
end
