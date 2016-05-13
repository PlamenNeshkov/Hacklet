class Sponsor < ActiveRecord::Base
  validates :name, :description, presence: true
  validates :site_url, :format => URI::regexp(%w(http https))

  mount_uploader :image, SponsorImageUploader
end
