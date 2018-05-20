class UsersController < ApplicationController
  before_action :set_user, only: [:dashboard]
  before_action :find_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    app_credential = AppCredential.new(credential_params)
    @user = app_credential.create_user(user_params)
    if app_credential.save && @user.save
      flash[:notice] = "Welcome to BikeShare!"
      session[:user_id] = @user.id
      redirect_to "/dashboard"
    else
      flash[:error] = "There was an error processing your account!"
      redirect_to new_user_path
    end
  end

  def edit
  end

  def update
    @user.update
  end

  def dashboard
  end

  private

  def user_params
    params[:user].permit(:first_name, :last_name, :email)
  end

  def credential_params
    params[:user].permit(:password)
  end

  def set_user
    @user = current_user
  end

  def find_user
    @user = User.find(params[:id])
  end
end
