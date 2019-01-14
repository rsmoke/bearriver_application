class ApplicationController < ActionController::Base
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


  def contest_is_open?
    if ApplicationSetting.current_app_settings.opendate > Time.now
      redirect_to conference_closed_url
    end
  end

  def contest_is_full?
    if ApplicationSetting.current_app_settings.application_buffer < Payment.where(transactionStatus: "1").count
      redirect_to conference_full_url
    end
  end
end
