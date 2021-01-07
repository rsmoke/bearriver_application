# == Schema Information
#
# Table name: workshops
#
#  id         :bigint           not null, primary key
#  instructor :string
#  last_name  :string
#  first_name :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Workshop, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
