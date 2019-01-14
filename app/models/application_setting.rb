class ApplicationSetting < ApplicationRecord

  validates :contest_year, presence: true, uniqueness: true
  validates :opendate, presence: true
  validates :application_buffer, presence: true

  scope :current_app_settings, -> { find_by(contest_year: Date.today.cwyear) }

end
