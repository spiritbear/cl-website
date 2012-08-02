class ModifyUsersAddBooleanFields < ActiveRecord::Migration
  def change
    add_column :users, :manager, :boolean, :default => false, :after => :sales_team_id
    add_column :users, :primary_contact, :boolean,  :default => false, :after => :manager
    add_column :users, :accepts_terms, :boolean, :default => false, :after => :primary_contact
  end

end