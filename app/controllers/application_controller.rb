class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :require_login
  
  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def require_login
    if logged_in?
      true
    else
      flash[:alert] = 'Please Login to continue'
      redirect_to new_user_path
    end
  end  
end
