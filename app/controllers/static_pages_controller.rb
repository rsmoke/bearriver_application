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
    @current_year = @app_settings.contest_year
    @opens_at = @app_settings.opendate
  end

  def conference_full
  end


private

  def set_application_settings
    @app_settings = ApplicationSetting.current_app_settings
  end
end
