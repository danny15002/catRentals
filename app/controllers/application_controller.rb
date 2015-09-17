class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def redirect_to_cats_index
    # fail
    if current_user
      redirect_to cats_url
    end
  end

  def current_user
    if session[:session_token]
      return User.find_by_session_token(session[:session_token])
    end
    nil
  end

  def login_user(user)

    if user
      user.reset_session_token!
      session[:session_token] = user.session_token # write to session, normally do not write to params
      redirect_to cats_url
    else
      raise "You shall not pass"
    end
  end

end
