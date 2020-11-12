module ExercisesHelper
  def nav_title
    if params[:external]
      raw("<h1 class='nav-title'>External exercises</h1>")
    else
      raw("<h1 class='nav-title'>Exercises</h1>")
    end
  end

  def time_tracker(track)
    raw("<p class='main-tracker'>
      Total time tracked: <strong>#{to_time(track.total_time)}</strong>
      </p>")
  end

  def exercise_icon(exercise)
    group = exercise.groups.first
    if group.nil? 
      image_tag(exercise.user.icon, class: 'item-icon') 
    else 
      link_to image_tag(group.Icon), 
      group_path(group.id), class: 'item-icon' 
    end
  end
end
