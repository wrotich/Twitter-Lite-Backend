class LikesController < ApplicationController
  before_action :find_tweet

  def index
    @likes = Like.all.order(updated_at: :desc)
    json_response(@likes)
  end

  def create
    @tweet.likes.create(user_id: current_user.id)
    redirect
  end

  def destroy
    @tweet.likes.where(user_id: current_user.id).destroy_all
    redirect
  end

  private

  def find_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end

  def redirect
    redirect_to tweet_path(@tweet)
  end
end
