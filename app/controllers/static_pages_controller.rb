class StaticPagesController < ApplicationController
  # before_action :current_application_open?, only: [:index]

  def index
    redirect_to conference_closed_url unless current_application_open?
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

end
