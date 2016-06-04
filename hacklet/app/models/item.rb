class Item < ActiveRecord::Base
  has_many :given_items
  has_many :users, through: :given_items

  validates :name, :qty, presence: true
end
