class CreateReviewRatings < ActiveRecord::Migration
  def change
    create_table :review_ratings do |t|
      t.belongs_to :review
      t.float :score
      t.string :ip_address      
      t.timestamps
    end
  end
end
