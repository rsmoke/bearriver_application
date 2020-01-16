class ApplicationSetting < ApplicationRecord

  validates :contest_year, presence: true, uniqueness: true
  validates :opendate, presence: true
  validates :application_buffer, presence: true
  validates :registration_fee, presence: true, numericality: true
  validates :lottery_buffer, presence: true, numericality: true
  validates :application_open_period, presence: true, numericality: { only_integer: true }
  # validates :active_application, presence: true
  has_rich_text :application_open_directions
  has_rich_text :application_closed_directions
  # scope :current_app_settings, -> { find_by(contest_year: Date.today.cwyear) }
  scope :get_current_app_settings, -> { where("active_application = ?", true).max }

end
