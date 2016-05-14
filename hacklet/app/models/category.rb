class Category < ActiveRecord::Base
  has_and_belongs_to_many :projects

  validates :name, presence: true

  def self.search(pattern)
    if pattern.blank?
      all
    else
      where('name LIKE ?', "%#{pattern}%")
    end
  end
end
