class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.string :email
      t.string :token
      t.boolean :accepted, :null => true

      t.belongs_to :invite
      t.belongs_to :user, :null => true

      t.timestamps
    end
  end
end
