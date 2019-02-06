class Application < ApplicationRecord

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true
  validates :birth_year, presence: true
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :country, presence: true
  validates :phone, presence: true
  validates :email, presence: true, uniqueness: { message: "You have submitted an application already" }
  validates :workshop_selection1, presence: true
  validates :workshop_selection2, presence: true
  validates :workshop_selection3, presence: true
  validates :lodging_selection, presence: true
  validates :partner_registration_selection, presence: true

  HOW_DID_YOU_HEAR = ['Word of Mouth', 'Magazine Advertisement', 'Online Advertisement', 'Newspaper Advertisement', 'Other']

  belongs_to :user

  def first_workshop_instructor
    Workshop.find(self.workshop_selection1).instructor
  end

  def second_workshop_instructor
    Workshop.find(self.workshop_selection2).instructor
  end

  def third_workshop_instructor
    Workshop.find(self.workshop_selection3).instructor
  end

  def lodging_description
    Lodging.find(self.lodging_selection).description 
  end

  def partner_registration_description
    PartnerRegistration.find(self.partner_registration_selection).description 
  end

  # def total_due
  #   cost_lodging = Lodging.find(self.lodging_selection).cost.to_f
  #   cost_partner = PartnerRegistration.find(self.partner_registration_selection).cost.to_f
  #   cost_lodging + cost_partner 
  # end
end
