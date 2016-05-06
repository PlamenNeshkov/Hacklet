class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.belongs_to :sender, class_name: 'User', index: true
      t.belongs_to :team
      t.timestamps
    end
  end
end
