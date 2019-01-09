class Enrollment < ApplicationRecord
  belongs_to :application
  belongs_to :workshop
end
