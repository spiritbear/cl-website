class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.belongs_to :company
      t.string    :email, :null => false
      t.string    :crypted_password, :null => false
      t.string    :password_salt, :null => false
      t.string    :old_password
      t.string    :persistence_token, :null => false
      t.string    :single_access_token, :null => false
      t.string    :perishable_token, :null => false
      t.string    :type, :null => false      
      t.string    :first_name
      t.string    :last_name
      t.string    :state, :null => false
      t.boolean   :terms_accepted, :default => false                  
      t.integer   :login_count, :default => 0
      t.datetime  :last_login_at
      t.string    :last_login_ip                  
      t.belongs_to :sales_team
      t.timestamps
    end
  end
end
