class ApplicationController < ActionController::Base
  # before_action :block_foreign_hosts
  include AdminHelper
  before_action :get_current_application_settings

private

  def get_current_application_settings
    @application_settings = ApplicationSetting.current_app_settings
  end

  def user_has_application?(user)
    # return true unless Application.find_by(user_id: user).nil?
    if Application.find_by(user_id: user).nil?
      false
    else
      true
    end
  end

  helper_method :user_has_application?

  def user_has_payments?(user)
    # return true unless Payment.find_by(user_id: user).nil?
    if Payment.find_by(user_id: user).nil?
      false
    else
      true
    end
  end

  helper_method :user_has_payments?

  def contest_is_closed?
    return false unless @application_settings.present? && ApplicationSetting.current_app_settings.opendate > Time.now
    redirect_to conference_closed_url
  rescue
    # code that deals with some exception
    redirect_to conference_closed_url
  end

  def contest_is_full?
    # if ApplicationSetting.current_app_settings.application_buffer <= Payment.where(transaction_status: "1").count
    if application_quota_full?
      redirect_to conference_full_url
    end
  end

  def payments_open?
    ApplicationSetting.current_app_settings.allow_payments
  end

  helper_method :payments_open?

  def application_quota_full?
    ApplicationSetting.current_app_settings.application_buffer <= Application.where("created_at > ?", @application_settings.opendate).count
  end

  helper_method :application_quota_full?

  def block_foreign_hosts
    if Rails.env.development?
      return false
    elsif request.remote_ip.start_with?("141.213")
      return false
    else
      redirect_to "https://www.umich.edu"
    end
  end

end
