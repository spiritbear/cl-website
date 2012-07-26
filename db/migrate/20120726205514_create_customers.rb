class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :day_phone_number
      t.string :alt_phone_number
      t.string :email
      t.string :street_address
      t.string :apartment
      t.string :city
      t.string :state
      t.string :zipcode
      t.date :last_service_date      
      t.timestamps
    end
  end
end
