class AddCompanyIdToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :company_id, :integer, :after => :id
  end
end