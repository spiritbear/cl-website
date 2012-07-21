class CreateSocialNetworkPages < ActiveRecord::Migration
  def change
    create_table :social_network_pages do |t|
      t.belongs_to :company
      t.string :page_id, :null => false
      t.string :access_token, :null => false
      t.string :access_token_secret, :default => nil
      t.string :page_name
      t.string :type
      t.string :state
      t.timestamps
    end
  end
end
