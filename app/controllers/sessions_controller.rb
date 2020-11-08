class SessionsController < ApplicationController
  before_action :require_login, only: [:destroy, :show]
  before_action :logged_out?, except: [:destroy, :show]
  
  def index; end
  
  def show
    @user = current_user
  end

  def new; end

  def create
    @user = User.find_by(Name: params[:Name])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = 'Succesfully logged in'
      redirect_to exercises_path
    else
      flash.now[:alert] = 'Please enter a valid Name'
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Succesfully logged out'
    redirect_to root_path
  end
end
