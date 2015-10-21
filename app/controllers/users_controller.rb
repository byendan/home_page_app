class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :show]
  before_action :correct_user,   only: [:edit, :update, :show, :destroy]
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Bookmark Page #{@user.name}"
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to root_path
  end
  
  def edit
    @tabs = current_user.tabs
  end
  
  private
   
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                    :password_confirmation)
    end
    
    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
    # Confirms the ocrrect user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
  
end
