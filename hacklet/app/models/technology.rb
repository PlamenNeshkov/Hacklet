class Technology < ActiveRecord::Base
  validates :name, :description, presence: true

  def self.search(pattern)
    if pattern.blank?
      all
    else
      where('name LIKE ?', "%#{pattern}%")
    end
  end
end
