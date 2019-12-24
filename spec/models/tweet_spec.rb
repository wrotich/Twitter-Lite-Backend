# == Schema Information
#
# Table name: tweets
#
#  id         :bigint(8)        not null, primary key
#  body       :string
#  created_by :string
#  tags       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Tweet, type: :model do
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:created_by) }
end
