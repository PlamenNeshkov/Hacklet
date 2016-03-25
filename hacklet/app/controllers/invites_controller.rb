class InvitesController < ApplicationController
  def new
    @invite = Invite.new
    @invite.team_id = params[:id]
  end

  def create
    @invite = Invite.new(invite_params)
    @invite.sender_id = current_user.id
    if @invite.save
      if @invite.recipient != nil
        InviteMailer.existing(@invite).deliver
        @invite.recipient.teams.push(@invite.team)
      else
        InviteMailer.new(
          @invite,
          new_user_registration_url(:invite_token => @invite.token)).deliver
      end

      redirect_to team_path(@invite.team_id)
    else
      # magic
    end
  end

  def invite_params
    params.require(:invite).permit(:email, :team_id)
  end
end
