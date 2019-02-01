class Payment < ApplicationRecord
  validates :transaction_id, presence: true, uniqueness: true
  validates :total_amount, presence: true
  belongs_to :user
end
