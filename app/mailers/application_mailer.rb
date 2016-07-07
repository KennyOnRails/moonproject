class ApplicationMailer < ActionMailer::Base
  add_template_helper(RealLivesHelper)
  add_template_helper(ProgressesHelper)
  default from: "service@moon-project.com"
  layout 'mailer'
end
