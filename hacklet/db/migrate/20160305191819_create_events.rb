class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :image
      t.datetime :start
      t.datetime :end
      t.integer :max_participants

      t.timestamps null: false
    end
  end
end
