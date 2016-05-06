class Invite < ActiveRecord::Base
  belongs_to :team
  belongs_to :sender, class_name: 'User'
  has_many :recipients
end
