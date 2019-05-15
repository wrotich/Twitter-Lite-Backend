# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  body       :string
#  created_by :string
#  tags       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# spec/factories/tweets.rb
FactoryBot.define do
  factory :tweet do
    body { Faker::Lorem.word }
    created_by { Faker::Number.number(10) }
    tags { "#" + Faker::Lorem.word }
  end
end
