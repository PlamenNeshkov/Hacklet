class User < ActiveRecord::Base
  before_create :set_default_role
  belongs_to :role

  has_many :participations
  has_many :teams, through: :participations
  has_many :invitations, :class_name => 'Invite', :foreign_key => 'recipient_id'
  has_many :sent_invites, :class_name => 'Invite', :foreign_key => 'sender_id'

  devise :database_authenticatable, :registerable, :recoverable,
    :rememberable, :trackable, :validatable, :confirmable,
    :lockable, :timeoutable

  def admin?
    self.role.name == 'admin'
  end

  private
  def set_default_role
   self.role = Role.find_by(name: 'registered')
  end
end
