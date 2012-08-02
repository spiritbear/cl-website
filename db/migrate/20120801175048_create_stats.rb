class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.belongs_to :company
      t.date :month_id      
      t.integer :logo_views_count, :default => 0      
      t.integer :pages_view_count, :default => 0
      t.integer :new_reviews_count, :default => 0
      t.integer :total_reviews_count, :default => 0                  
      t.integer :reviews_view_count, :default => 0      
      t.float :view_conversion, :default => 0
      t.float :new_reviews_average_score, :default => 0
      t.float :approval_rating, :default => 0            
      t.timestamps
    end
  end
end
