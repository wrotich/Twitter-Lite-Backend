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

class TweetSerializer < ActiveModel::Serializer
  attributes \
    :id,
    :body,
    :created_by,
    :created_at,
    :tags,
    :curr_user

  def created_at
    TimeDiffCalc.call(object.created_at)
  end

  def curr_user
    curr_user = User.select(:name, :id).where(
      id: object.created_by
      ).pluck(:name)[0]
    curr_user
  end
end
