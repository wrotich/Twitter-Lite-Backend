# spec/factories/tweets.rb
FactoryBot.define do
  factory :tweet do
    body { Faker::Lorem.word }
    # created_by { Faker::Number.number(10) }
  end
end
