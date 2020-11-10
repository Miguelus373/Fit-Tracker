module ApplicationHelper
  def time_tracker(track)
    raw("
    <p class='main-tracker'>Total time tracked: <strong>#{to_time(track.total_time)}</strong></p>
    ")
  end
end
