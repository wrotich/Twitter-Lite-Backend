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

RSpec.describe TweetSerializer, type: :serializer do
  let(:user) { create(:user) }
  let!(:tweet) { create(:tweet) }

  subject { described_class }

  it 'not empty' do
    response = subject.new(tweet).to_json
    expect(response).not_to be_nil
  end

  it 'return a hash' do
    response = subject.new(tweet).to_json
    expect(JSON.parse(response)).to be_a Object
  end
end
