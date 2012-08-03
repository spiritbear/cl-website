class ModifyReviewTable < ActiveRecord::Migration
  def change
    add_column :reviews, :average_score, :float, :default => 0.0, :after => :content
    add_column :reviews, :ip_address, :string, :after => :state    
    add_column :reviews, :reviewer_state, :string, :after => :ip_address
    add_column :reviews, :reviewer_city,:string, :after => :reviewer_state
  end
end