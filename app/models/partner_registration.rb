# == Schema Information
#
# Table name: partner_registrations
#
#  id          :bigint           not null, primary key
#  description :string
#  cost        :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class PartnerRegistration < ApplicationRecord

  def display_info
    "#{ self.description} ( $#{self.cost.to_i} additional fee)"
  end
end
