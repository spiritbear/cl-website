class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.belongs_to :review
      t.belongs_to :customer
      t.date :written_date
      t.text :content
      t.string :state      
      t.timestamps
    end
  end
end
