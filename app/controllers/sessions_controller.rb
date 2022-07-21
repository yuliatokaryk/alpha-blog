class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = t("login_success")
      redirect_to user
    else
      flash.now[:alert] = t("login_error")
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = t("logged_out")
    redirect_to root_path
  end
end