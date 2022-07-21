class UsersController < ApplicationController
  before_action :set_user,  only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def show
    @articles = @user.articles
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.number = rand(1..18)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = t("welcome_to")
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = t("user_update")
      redirect_to user_path
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    flash[:notice] = t("user_delete")
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :about)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user
      flash[:alert] = t("error_not_permision_user")
      redirect_to @user
    end
  end
end
