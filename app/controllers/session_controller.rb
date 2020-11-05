class SessionController < ApplicationController
  def new; end

  def create
    @user = User.find_by(Name: params[:Name])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = 'Succesfully logged in'
      redirect_to users_path
    else
      flash.now[:alert] = 'Please enter a valid Name'
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Succesfully logged out'
    redirect_to users_path
  end
end
