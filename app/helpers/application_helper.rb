module ApplicationHelper
  def navbar
    return if current_page?(root_path) || current_page?(menu_path)

    if logged_in?
      raw("<nav class='nav'>
        #{link_to raw("<i class='fa fa-bars' aria-hidden='true'></i>"), menu_path, class: 'left-btn'}
        #{link_to 'Logout', '/logout', method: 'post', class: 'logout-btn'}
        </nav>")
    else
      raw("<nav class='nav'>
      #{link_to raw("<i class='fa fa-arrow-left' aria-hidden='true'></i>"), root_path, class: 'left-btn'}
      </nav>")
    end
  end
end
