class SessionsController < ApplicationController
  before_action :redirect_authenticated, only: [:create, :new]

  def create
    @user = User.find_by(email: valid_params["email"].downcase)
    if @user && @user.authenticate(valid_params["password"])
      login @user
      redirect_to root_path, notice: "Signed in."
    else
      flash.now[:alert] = "Incorrect email or password."
      render :new, status: :unauthorized
    end
  end

  private

  def valid_params
    validated_params ||= params.require("credentials").permit("email", "password")
  end
end
