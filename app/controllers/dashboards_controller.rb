# frozen_string_literal: true

class DashboardsController < ApplicationController
  before_action :authenticated?

  def index; end

  private

  def authenticated?
    redirect_to '/login' unless current_user
  end
end
