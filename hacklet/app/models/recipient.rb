class Recipient < ActiveRecord::Base
  belongs_to :invite
  belongs_to :user

  validates :email, presence: true

  before_create :generate_token
  before_save :assign_user_if_registered

  def generate_token
    self.token = Digest::SHA1.hexdigest([
        self.email,
        Time.now,
        rand].join)
  end

  def assign_user_if_registered
    user = User.find_by_email(self.email)
    if user
      self.user = user
    end
  end

  def has_assigned_user
    self.user != nil
  end
end
