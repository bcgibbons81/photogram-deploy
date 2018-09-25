class UsersController < ApplicationController
  skip_before_action :require_valid_user!
  before_action :authorize_admin, only: [:destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] =  'You have successfully created an account.  Please sign in to continue.'
      redirect_to login_path
    else
      render :new
    end
  end

  

def index
 #@users = User.all
 @user = User.find_by(user_name: params[:user_name])

 @users = if params[:term]
  User.search(params[:term])
else
  User.all
end
end

def destroy
    User.find_by(user_name: params[:user_name]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end


private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :user_name, :avatar, :bio, :term)
  end
end

def authorize_admin
    redirect_to root_path, alert: "Permissions denied" unless
     current_user.admin?
end
