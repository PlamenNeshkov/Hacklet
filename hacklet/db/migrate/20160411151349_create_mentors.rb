class CreateMentors < ActiveRecord::Migration
  def change
    create_table :mentors do |t|
      t.references :user, index: true, foreign_key: true
      t.boolean :approved

      t.timestamps null: false
    end
  end
end
