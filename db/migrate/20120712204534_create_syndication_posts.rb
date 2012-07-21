class CreateSyndicationPosts < ActiveRecord::Migration
  def change
    create_table :syndication_posts do |t|
      t.belongs_to :social_network_page      
      t.belongs_to :review
      t.integer :attempts      
      t.string :state      
      t.text :notes
      t.timestamps
    end
  end
end
