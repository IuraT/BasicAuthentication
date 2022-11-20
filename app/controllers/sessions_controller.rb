# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :redirect_authenticated, only: %i[create new]

  def new; end

  def create
    @user = User.find_by(email: valid_params['email'].downcase)
    if @user&.authenticate(valid_params['password'])
      login @user
      redirect_to root_path, notice: 'Signed in.'
    else
      flash.now[:alert] = 'Incorrect email or password.'
      render :new, status: :unauthorized
    end
  end

  def destroy
    logout
    redirect_to '/login', notice: 'Logged out'
  end

  private

  def valid_params
    @valid_params ||= params.require('credentials').permit('email', 'password')
  end
end
