class ApplicationSetting < ApplicationRecord

  validates :contest_year, presence: true, uniqueness: true
  validates :opendate, presence: true
  validates :application_buffer, presence: true
  # validates :active_application, presence: true

  # scope :current_app_settings, -> { find_by(contest_year: Date.today.cwyear) }
  scope :get_current_app_settings, -> { where("active_application = ?", true).max }

end
