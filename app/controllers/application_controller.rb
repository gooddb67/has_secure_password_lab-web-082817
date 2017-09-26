class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :logged_in?, :log_in

  def log_in(user_id)
    session[:user_id] = user_id
  end

  def logged_in?
    !!session[:user_id] #if false, make true, if true, make false. coercison.
  end

  def log_out()
    session.delete :user_id
  end
end
