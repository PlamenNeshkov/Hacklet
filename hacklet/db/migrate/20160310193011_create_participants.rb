class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.belongs_to :user, index: true
      t.belongs_to :team, index: true
      t.belongs_to :invite, index: true
    end
  end
end
