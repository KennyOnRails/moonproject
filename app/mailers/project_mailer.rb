class ProjectMailer < ApplicationMailer
  def notify_project(project)
    @project = project
    @real_lives = @project.real_lives
    @progresses = @project.progresses
    @notify_method = @project.notify
    @editable = false
    mail(to: @notify_method.email, subject: "[Moon Project] 恭喜你訂定了偉大的登月計劃-#{@project.target}")
  end
end
