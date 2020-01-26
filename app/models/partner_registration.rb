class PartnerRegistration < ApplicationRecord

  def display_info
    "#{ self.description} ( $#{self.cost.to_i} additional fee)"
  end
end
