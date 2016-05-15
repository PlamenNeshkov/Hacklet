class User < ActiveRecord::Base
  before_create :set_default_role
  belongs_to :role

  has_many :participations
  has_many :teams, through: :participations
  has_many :invitations, :class_name => 'Recipient'
  has_many :sent_invites, :class_name => 'Invite', :foreign_key => 'sender_id'
  has_many :attendances
  belongs_to :user

  validates :first_name, :last_name, presence: true

  mount_uploader :avatar, AvatarUploader
  blogs
  devise :database_authenticatable, :registerable, :recoverable,
    :rememberable, :trackable, :validatable, :confirmable,
    :lockable, :timeoutable

  def admin?
    self.role.name == 'admin'
  end

  def self.search(pattern)
    if pattern.blank?
      all
    else
      where('email LIKE ?', "%#{pattern}%")
    end
  end

  def set_default_role
   self.role = Role.find_by(name: 'registered')
  end

  def full_name
    self.first_name + ' ' + self.last_name
  end
end
