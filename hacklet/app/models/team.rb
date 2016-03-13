class Team < ActiveRecord::Base
  belongs_to :event
  has_many :participations
  has_many :members, through: :participations, class_name: 'User'
  has_many :invites
  has_one :captain, class_name: 'User'
  before_create :check_user_team_uniqueness

  private
    def check_user_team_uniqueness
      captain_teams_events = Team
        .where(captain_id: self.captain_id)
        .pluck(:event_id)

      if captain_teams_events.include? self.event.id
        self.errors.add(:base, "You can only have one team for an event")
        return false
      else
        return true
      end
    end
end
