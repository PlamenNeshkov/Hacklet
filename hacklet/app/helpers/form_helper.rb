module FormHelper
  def setup_team(team)
    team.project ||= Project.new
    team
  end
end

