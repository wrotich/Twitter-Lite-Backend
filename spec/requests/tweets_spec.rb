# spec/requests/tweets_spec.rb
require 'rails_helper'

RSpec.describe 'tweets API', type: :request do
  # initialize test data
  let(:user) { create(:user) }
  let!(:tweets) { create_list(:tweet, 10, created_by: user.id) }
  let(:tweet_id) { tweets.first.id }
  # authorize request
  let(:headers) { valid_headers }

  # Test suite for GET /tweets
  describe 'GET /tweets' do
    # make HTTP get request before each example
    before { get '/tweets', params: {}, headers: headers }

    it 'returns tweets' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for POST /tweets
  describe 'POST /tweets' do
    # valid payload
    let(:valid_attributes) do
      { body: 'Learn Elm', created_by: user.id.to_s }.to_json
    end

    context 'when the request is valid' do
      before { post '/tweets', params: valid_attributes, headers: headers }

      it 'creates a tweet' do
        expect(json['body']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { body: nil }.to_json }
      before { post '/tweets', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json['message'])
          .to match(/Validation failed: Body can't be blank/)
      end
    end
  end

  # Test suite for PUT /tweets/:id
  describe 'PUT /tweets/:id' do
    let(:valid_attributes) { { body: 'Shopping' }.to_json }

    context 'when the record exists' do
      before { put "/tweets/#{tweet_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /tweets/:id
  describe 'DELETE /tweets/:id' do
    before { delete "/tweets/#{tweet_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
