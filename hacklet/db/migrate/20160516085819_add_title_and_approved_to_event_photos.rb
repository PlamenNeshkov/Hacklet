class AddTitleAndApprovedToEventPhotos < ActiveRecord::Migration
  def change
    add_column :event_photos, :title, :string
    add_column :event_photos, :approved, :boolean
  end
end
