class User < ActiveRecord::Base
  has_many :participants
  has_many :teams, through: :participants
  devise :database_authenticatable, :registerable, :recoverable,
    :rememberable, :trackable, :validatable, :confirmable,
    :lockable, :timeoutable
end
