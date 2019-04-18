FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { 'foo.name@andela.com' }
    password { 'foobar' }
  end
end
