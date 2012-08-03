class CreateDefaultReviewTopics < ActiveRecord::Migration
  def change
    create_table :default_review_topics do |t|
      t.string :title, :null => false
      t.integer :sort_order      
      t.timestamps
    end
  end
end
