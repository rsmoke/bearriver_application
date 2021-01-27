# == Schema Information
#
# Table name: application_settings
#
#  id                                 :bigint           not null, primary key
#  opendate                           :datetime
#  application_buffer                 :integer
#  contest_year                       :integer
#  time_zone                          :string
#  created_at                         :datetime         not null
#  updated_at                         :datetime         not null
#  allow_payments                     :boolean          default(FALSE)
#  active_application                 :boolean          default(FALSE), not null
#  allow_lottery_winner_emails        :boolean          default(FALSE), not null
#  allow_lottery_loser_emails         :boolean          default(FALSE), not null
#  registration_fee                   :decimal(, )      default(50.0), not null
#  lottery_buffer                     :integer          default(50), not null
#  application_open_directions        :text
#  application_closed_directions      :text
#  application_open_period            :integer          default(48), not null
#  lottery_result                     :integer          is an Array
#  lottery_run_date                   :datetime
#  registration_acceptance_directions :text
#  payments_directions                :text
#  lottery_won_email                  :text
#  lottery_lost_email                 :text
#  subscription_cost                  :integer          default(0), not null
#  subscription_directions            :text
#
require 'rails_helper'

RSpec.describe ApplicationSetting, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
