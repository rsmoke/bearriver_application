class Lodging < ApplicationRecord
  has_one :reservation, dependent: :destroy
  has_one :application, through: :reservation
end
