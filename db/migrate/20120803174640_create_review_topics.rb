class CreateReviewTopics < ActiveRecord::Migration
  def change
    create_table :review_topics do |t|
      t.belongs_to :company
      t.belongs_to :default_review_topic
      t.string :state
      t.float :average_score      
      t.timestamps
    end
  end
end
