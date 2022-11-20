class DashboardsController < ApplicationController
  before_action :is_authenticated?

  def index
  end

  private

  def is_authenticated?
    redirect_to "/login" unless current_user
  end
end
