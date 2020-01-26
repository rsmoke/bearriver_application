class LotteryMailer < ApplicationMailer

  def won_lottery_email
    @application = params[:application]
    @current_application_settings = ApplicationSetting.get_current_app_settings
    mail(to: @application.email, subject: "You have been selected by lottery for a place in the 
      #{@current_application_settings.contest_year} Bear River Writers’ Conference.")
  end

  def lost_lottery_email  
    @application = params[:application]
    @current_application_settings = ApplicationSetting.get_current_app_settings
    mail(to: @application.email, subject: "#{@current_application_settings.contest_year} Bear River Writers’ Conference lottery result")
  end
end
