class StaticPagesController < ApplicationController
  before_action :set_application_settings
  before_action :contest_is_closed?, only: [:index]
  before_action :contest_is_full?, only: [:index]

  def index

  end

  def about
  end

  def contact
  end

  def privacy
  end

  def terms_of_use
  end

  def conference_closed
  end

  def conference_full
  end


private
  def contest_is_closed?
    if ApplicationSetting.current_app_settings.present?
      application_opens = ApplicationSetting.current_app_settings.opendate
      range = application_opens..(application_opens + 2.days)
      redirect_to conference_closed_url unless range.include?(Time.now)
    end
  end

  def contest_is_full?
    # if ApplicationSetting.current_app_settings.application_buffer <= Payment.where(transaction_status: "1").count
    if application_quota_full?
      redirect_to conference_full_url
    end
  end

  def application_quota_full?
    ApplicationSetting.current_app_settings.application_buffer <= Application.where("created_at > ?", @application_settings.opendate).count
  end

  def set_application_settings
    @application_settings = ApplicationSetting.current_app_settings
  end
end
