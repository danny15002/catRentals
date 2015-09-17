class SessionsController < ApplicationController
  before_action :redirect_to_cats_index, except: :destroy

  def new
    @user = User.new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:user_name],
      params[:user][:password]
    )

    login_user(user)
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end
end
