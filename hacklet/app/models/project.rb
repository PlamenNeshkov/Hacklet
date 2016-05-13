class Project < ActiveRecord::Base
  belongs_to :team
  has_and_belongs_to_many :technologies

  validates :name, :description, presence: true
  validates :repository_url, :format => URI::regexp(%w(http https)), :allow_blank => true

  mount_uploader :image, ProjectImageUploader
end
