# == Schema Information
#
# Table name: applications
#
#  id                             :bigint           not null, primary key
#  first_name                     :string
#  last_name                      :string
#  gender                         :string
#  birth_year                     :integer
#  street                         :string
#  street2                        :string
#  city                           :string
#  state                          :string
#  zip                            :string
#  country                        :string
#  phone                          :string
#  email                          :string
#  email_confirmation             :string
#  workshop_selection1            :string
#  workshop_selection2            :string
#  workshop_selection3            :string
#  lodging_selection              :string
#  partner_registration_selection :string
#  partner_first_name             :string
#  partner_last_name              :string
#  how_did_you_hear               :string
#  accessibility_requirements     :text
#  special_lodging_request        :text
#  food_restrictions              :text
#  user_id                        :bigint
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#  conf_year                      :integer
#  lottery_position               :integer
#  offer_status                   :string
#  result_email_sent              :boolean          default(FALSE), not null
#  offer_status_date              :datetime
#  subscription                   :boolean          default(FALSE)
#
require 'rails_helper'

RSpec.describe Application, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
