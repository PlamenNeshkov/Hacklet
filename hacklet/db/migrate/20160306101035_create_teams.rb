class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.belongs_to :event, index: true
      t.belongs_to :captain, class_name: 'User', index: true

      t.timestamps null: false
    end
  end
end
