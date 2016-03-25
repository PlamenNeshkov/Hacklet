class Project < ActiveRecord::Base
  belongs_to :team

  validates :name, :description, presence: true
  validates :repository_url, :format => URI::regexp(%w(http https)), :allow_blank => true
end
