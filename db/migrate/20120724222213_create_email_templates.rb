class CreateEmailTemplates < ActiveRecord::Migration
  def change
    create_table :email_templates do |t|
      t.string :category
      t.string :from_email
      t.text :subject
      t.text :message      
      t.timestamps
    end
  end
end
