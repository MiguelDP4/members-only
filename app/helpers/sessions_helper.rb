# frozen_string_literal: true

module SessionsHelper
  def log_in(user)
    user.remember_token = User.new_token
    cookies.permanent[:remember_token] = user.remember_token
    session[:user_id] = user.id
    user.save
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def log_out
    cookies[:remember_token] = nil
    session.delete(:user_id)
    @current_user = nil
  end
end
