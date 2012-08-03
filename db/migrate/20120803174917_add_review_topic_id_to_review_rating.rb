class AddReviewTopicIdToReviewRating < ActiveRecord::Migration
  def change
    add_column :review_ratings, :review_topic_id, :float, :after => :review_id, :null => false, :default => 0.0
  end
end