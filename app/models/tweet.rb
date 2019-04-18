class Tweet < ApplicationRecord
  # validations
  validates_presence_of :body, :created_by
end
