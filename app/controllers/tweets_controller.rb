class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[show update destroy]

  # GET /tweets
  def index
    @tweets = current_user.tweets
    json_response(@tweets)
  end

  # POST /tweets
  def create
    @tweet = current_user.tweets.create!(tweet_params)
    json_response(@tweet, :created)
  end

  # PUT /tweets/:id
  def update
    @tweet.update(tweet_params)
    head :no_content
  end

  # DELETE /tweets/:id
  def destroy
    @tweet.destroy
    head :no_content
  end

  private

  def tweet_params
    # whitelist params
    params.permit(:body)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
