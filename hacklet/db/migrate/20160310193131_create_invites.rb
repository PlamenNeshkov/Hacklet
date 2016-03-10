class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.belongs_to :sender, class_name: 'User', index: true
      t.belongs_to :received, class_name: 'User', index: true
      t.datetime :sent_on
      t.boolean :accepted
    end
  end
end
