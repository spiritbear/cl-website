class ModifySocialNetworkPages < ActiveRecord::Migration
  def up
    remove_column :social_network_pages, :company_id  
    add_column :social_network_pages, :source_id, :integer, :after => :id
    add_column :social_network_pages, :source_type, :string, :after => :source_id
    add_column :social_network_pages, :category, :string, :after => :page_name
  end
  
  def down
    remove_column :social_network_pages, :category
    remove_column :social_network_pages, :source_id
    remove_column :social_network_pages, :source_type
    add_column :social_network_pages, :company_id, :integer      
  end

end