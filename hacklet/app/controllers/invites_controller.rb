class InvitesController < ApplicationController
  def create
    @invite = Invite.new(invite_params)
    @invite.sender_id = current_user.id
    if @invite.save
      if @invite.recipient != nil
        InviteMailer.send_to_existing_user(@invite).deliver
        @invite.recipient.teams.push(@invite.team)
      else
        InviteMailer.send_to_new_user(@invite, new_user_registration_path(
          :invite_token => @invite.token)).deliver
      end
    else
      # magic
    end
  end
end
