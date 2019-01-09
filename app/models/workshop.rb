class Workshop < ApplicationRecord
  validates :instructor, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :enrollments, dependent: :destroy
  has_many :applications, through: :enrollments

  def self.order_by_lastname
    order('last_name asc')
  end

end
