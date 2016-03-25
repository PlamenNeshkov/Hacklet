class Event < ActiveRecord::Base
  has_many :teams, dependent: :destroy
  mount_uploader :image, EventImageUploader

  validates :title, :description, :start, :end, :max_participants, presence: true
  validates :title, uniqueness: true
  #validates_format_of :image,
  #  :with => %r{\.(png|jpg|jpeg|gif)\Z}i,
  #  :message => 'must have a GIF, JPG or PNG extension'
  validates :max_participants, numericality: { greater_than_or_equal_to: 1 }
  before_save :ensure_only_one_active_event

  def ensure_only_one_active_event
    if self.active?
      current_active_event = Event.find_by(active: true)
      if current_active_event != nil
        current_active_event.active = false
        current_active_event.save
      end
    end
  end
end
