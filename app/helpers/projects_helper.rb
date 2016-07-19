module ProjectsHelper
  def render_complete_rate(project)
    if project.progresses_count != 0 then
      rate = ((project.confirm_count.to_f / project.progresses_count) * 100).floor
    else
      rate = 0
    end
  end
  def render_random_image
    r = Random.new      
    img_tag = image_tag("portfolio/#{r.rand(1...12)}.jpg", alt: "img01")
  end
end
