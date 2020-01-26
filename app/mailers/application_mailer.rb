class ApplicationMailer < ActionMailer::Base
  default from: 'bearriver-questions@umich.edu',
          bcc: 'bearriver-communications@umich.edu'
  layout 'mailer'
end
