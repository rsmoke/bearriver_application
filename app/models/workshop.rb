class Workshop < ApplicationRecord
  validates :instructor, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.order_by_lastname
    order('last_name asc')
  end

end
