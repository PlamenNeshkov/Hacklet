class CreateGivenItems < ActiveRecord::Migration
  def change
    create_table :given_items do |t|
      t.references :user, index: true, foreign_key: true
      t.references :item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
