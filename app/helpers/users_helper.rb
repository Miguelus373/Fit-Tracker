module UsersHelper
  def nav_title
    if params[:external]
    raw("<h1 class='nav-title'>External exercises</h1>")
    else
    raw("<h1 class='nav-title'>Exercises</h1>")
    end
  end
end
