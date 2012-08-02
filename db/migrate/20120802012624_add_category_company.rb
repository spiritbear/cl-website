class AddCategoryCompany < ActiveRecord::Migration
  def change
    create_table :categories_companies, :id => false do |t|
      t.integer :category_id
      t.integer :company_id      
    end
  end
end