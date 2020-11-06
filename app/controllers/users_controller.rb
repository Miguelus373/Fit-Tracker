class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.create(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to exercises_path
    else
      flash.now[:alert] = 'Name already taken'
      render 'new'
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:Name)
    end
end
