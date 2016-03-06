class Event < ActiveRecord::Base
  mount_uploader :image, EventImageUploader

  validates :title, :description, :start, :end, :max_participants, presence: true
  validates :title, uniqueness: true
  #validates_format_of :image,
  #  :with => %r{\.(png|jpg|jpeg|gif)\Z}i,
  #  :message => 'must have a GIF, JPG or PNG extension'
  validates :max_participants, numericality: { greater_than_or_equal_to: 1 }
end
