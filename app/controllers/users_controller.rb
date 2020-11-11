class UsersController < ApplicationController
  before_action :require_login, except: %i[new create]

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
      redirect_to menu_path
    else
      flash.now[:alert] = @user.errors.full_messages[0]
      render 'new'
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:Name, :icon)
  end
end
