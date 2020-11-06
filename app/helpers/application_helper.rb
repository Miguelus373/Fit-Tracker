module ApplicationHelper
  def navbar
    unless current_page?(root_path)
      raw("<nav>
        </nav>")
    end
  end
end
