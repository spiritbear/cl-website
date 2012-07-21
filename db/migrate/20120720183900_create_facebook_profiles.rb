class CreateFacebookProfiles < ActiveRecord::Migration
  def change
    create_table :facebook_profiles do |t|
      t.belongs_to :customer
      t.string :profile_id      
      t.string :access_token      
      t.string :state      
      t.timestamps
    end
  end
end
