class UsersController < ApplicationController
  before_action :redirect_to_cats_index, except: :destory


  def new
    @user = User.new
  end

  def create
    @user = User.create!(user_params)

    login_user(@user)
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
