module ProjectsHelper
  def render_complete_rate(project)
    if project.progresses_count != 0 then
      rate = ((project.confirm_count.to_f / project.progresses_count) * 100).floor
    else
      rate = 0
    end
  end
end
