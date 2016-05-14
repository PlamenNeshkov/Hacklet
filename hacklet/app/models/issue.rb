class Issue < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  validates :title, :description, presence: true
end
