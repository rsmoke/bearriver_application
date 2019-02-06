class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable

  has_many :payments, dependent: :destroy
  has_one :application #, dependent: :destroy

  def total_paid
    payments.pluck(:total_amount).map{ |v| v.to_f }.sum / 100
  end
end
