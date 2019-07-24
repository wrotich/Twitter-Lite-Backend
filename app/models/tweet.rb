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

class Tweet < ApplicationRecord
  has_many :likes, dependent: :destroy

  # validations
  validates_presence_of :body, :created_by
end
