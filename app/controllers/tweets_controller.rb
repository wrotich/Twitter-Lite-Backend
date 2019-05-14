class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[show update destroy]

  # GET /tweets
  def index
    @tweets = Tweet.all.order(updated_at: :desc)
    json_response(@tweets)
  end

  # POST /tweets
  def create
    @tweet = current_user.tweets.create!(tweet_params)
    json_response(@tweet, :created)
  end

  # GET /tweets/:id
  def show
    json_response(@tweet)
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

  # GET /tweets/:tags
  def find_by_tag
    @tweets = Tweet.where("tags LIKE ?", "%#" + params[:tags] + "%")
    json_response(@tweets)
  end

  private

  def tweet_params
    # whitelist params
    @body = params[:body]
    @tags = @body.scan(/#\w+/) unless @body.nil?
    params[:tags] = @tags.to_s
    params.permit(:body, :tags)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
