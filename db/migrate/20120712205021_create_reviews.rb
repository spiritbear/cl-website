class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.belongs_to :company
      t.belongs_to :customer
      t.text :summary
      t.text :content
      t.date :written_date      
      t.string :state      
      t.timestamps
    end
  end
end
