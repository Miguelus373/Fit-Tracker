class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :require_login, :logged_out?, :to_time
  
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
      redirect_to root_path
    end
  end  
  
  def logged_out?
    if logged_in?
      redirect_to menu_path
    else
      true
    end
  end

  def to_time(time)
    "#{time/60}:" + (time%60 < 10 ? '0' + "#{time%60}" : 
    "#{time%60}" + (time%60 < 10 ? '0' : ''))
  end
end
