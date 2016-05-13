class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :name
      t.string :description
      t.string :site_url
      t.string :image

      t.timestamps null: false
    end
  end
end
