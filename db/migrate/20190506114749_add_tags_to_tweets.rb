class AddTagsToTweets < ActiveRecord::Migration[5.0]
  def change
    add_column :tweets, :tags, :text
  end
end
