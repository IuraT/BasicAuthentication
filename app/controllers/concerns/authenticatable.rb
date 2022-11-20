module Authenticatable
  extend ActiveSupport::Concern

  included do
    before_action :current_user
    helper_method :current_user
  end

  def login(user)
    session[:current_user_id] = user.id
  end

  def logout
    reset_session
  end

  def redirect_authenticated
    redirect_to root_path if current_user
  end

  private

  def current_user
    @user ||= User.find_by(id: session[:current_user_id]) if session[:current_user_id]
  end
end
