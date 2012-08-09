class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to :review
      t.belongs_to :customer
      t.text :question
      t.text :reviewer_answer
      t.text :company_answer      
      t.string :state      
      t.string :email_key      
      t.timestamps
    end
  end
end
