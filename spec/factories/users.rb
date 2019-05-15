# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  name            :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { 'foo.name@andela.com' }
    password { 'foobar8889583539845' }
  end
end
