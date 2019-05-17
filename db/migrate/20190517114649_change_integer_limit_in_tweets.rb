class ChangeIntegerLimitInTweets < ActiveRecord::Migration[5.0]
    def change
      change_column :tweets, :id, :integer, limit: 8
    end
  end