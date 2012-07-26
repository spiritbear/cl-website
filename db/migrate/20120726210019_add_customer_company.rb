class AddCustomerCompany < ActiveRecord::Migration
  def up
    create_table :companies_customers, :id => false do |t|
      t.belongs_to :company
      t.belongs_to :customer
    end
  end

  def down
  end
end