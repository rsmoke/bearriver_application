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

  def total_cost
    cost_lodging = Lodging.find(self.application.lodging_selection).cost.to_f
    cost_partner = PartnerRegistration.find(self.application.partner_registration_selection).cost.to_f
    cost_lodging + cost_partner 
  end
end
