class EventPhoto < ActiveRecord::Base
  belongs_to :event

  mount_uploader :image, EventPhotoUploader
end
