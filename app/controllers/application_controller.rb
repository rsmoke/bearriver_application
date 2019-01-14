class ApplicationController < ActionController::Base
  before_action :block_foreign_hosts

private
  def require_admin
    unless current_user_admin?
      redirect_to root_url, alert: "Unauthorized access!"
    end
  end

  def current_user_admin?
    current_user && current_user.admin?
  end

  helper_method :current_user_admin?


  def contest_is_closed?
    return false unless ApplicationSetting.current_app_settings && ApplicationSetting.current_app_settings.opendate > Time.now
      redirect_to conference_closed_url
    end
  end

  def contest_is_full?
    if ApplicationSetting.current_app_settings.application_buffer < Payment.where(transactionStatus: "1").count
      redirect_to conference_full_url
    end
  end

  def block_foreign_hosts
    redirect_to "https://www.umich.edu" unless request.remote_ip.start_with?("141.213")
  end

  # def whitelisted?(ip)
  #   return true if [141.211.27.245].include?(ip)
  #   false
  # end
  #
  # def block_foreign_hosts
  #   return false if whitelisted?(request.remote_ip)
  #   redirect_to "https://www.umich.edu" unless request.remote_ip.start_with?("141.213.")
  # end
end
