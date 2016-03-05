class Event < ActiveRecord::Base
  mount_uploader :image, EventImageUploader

  validates :title, :description, :image,
    :start, :end, :max_participants, presence: true
  validates :title, uniqueness: true
  validates :image, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'must have a GIF, JPG or PNG extension'
  }
  validates :max_participants, numericality: { greater_than_or_equal_to: 1 }
end
