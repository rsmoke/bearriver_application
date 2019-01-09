class Reservation < ApplicationRecord
  belongs_to :application
  belongs_to :lodging
end
