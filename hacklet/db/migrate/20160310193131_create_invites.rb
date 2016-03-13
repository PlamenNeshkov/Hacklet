class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :email
      t.belongs_to :sender, class_name: 'User', index: true
      t.belongs_to :recipient, class_name: 'User', index: true
      t.datetime :sent_on
      t.boolean :accepted
      t.timestamps
    end
  end
end
