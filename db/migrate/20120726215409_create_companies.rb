class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, :null => false
      t.text :description
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zipcode
      t.text :formatted_address
      t.string :latitude
      t.string :longitude
      t.string :phone_number
      t.string :website
      t.string :state
      t.string :slug                  
      t.timestamps
    end
  end
end
