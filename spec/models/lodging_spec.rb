# == Schema Information
#
# Table name: lodgings
#
#  id          :bigint           not null, primary key
#  plan        :string
#  description :string
#  cost        :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Lodging, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
