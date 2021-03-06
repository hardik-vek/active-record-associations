class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice]="logged in successfully"
      redirect_to events_path
    else
      flash.now[:alert]="there is something wronged with login detail"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice]="Logged out"
    redirect_to root_path
  end
end
