# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :redirect_authenticated, only: [:create, :new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(valid_params)
    if @user.save
      redirect_to root_path, notice: 'User created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def valid_params
    params.require(:user).permit(:name, :surname, :email, :password, :password_confirmation)
  end
end
