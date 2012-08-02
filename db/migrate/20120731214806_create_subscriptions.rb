class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.belongs_to :company
      t.datetime   :last_checked_at
      t.string     :state      
      t.text       :note
      t.timestamps
    end
  end
end
