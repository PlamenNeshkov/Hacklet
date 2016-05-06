class InvitesController < ApplicationController
  def new
    @invite = Invite.new
    @invite.team_id = params[:id]
  end

  def create
    @invite = Invite.new(invite_params)
    @invite.sender_id = current_user.id
    if recipient_params[:reg_recipients]
      recipient_params[:reg_recipients].split(', ').each do |email|
        recipient = Recipient.create(email: email, accepted: false)
        recipient.user = User.find_by_email(email)
        @invite.recipients.push(recipient)
      end
    elsif recipient_params[:new_recipients]
      recipient_params[:new_recipients].split(', ').each do |email|
        recipient = Recipient.create(email: email, accepted: false)
        @invite.recipients.push(recipient)
      end
    end

    if @invite.save
      @invite.recipients.each do |recipient|
        if recipient.has_assigned_user
          InviteMailer.to_user(@invite, recipient).deliver
          recipient.user.teams.push(@invite.team)
        else
          InviteMailer.to_new(
            @invite,
            recipient,
            new_user_registration_url(:invite_token => recipient.token)
          ).deliver
        end
      end

      redirect_to team_path(@invite.team_id)
    else
      # Handle error
    end
  end

  def search_recipients
    users = User.search(params[:query])

    respond_to do |format|
      format.json { render json: users }
    end
  end

  def invite_params
    params.require(:invite).permit(:team_id)
  end

  def recipient_params
    params.require(:invite).permit(:reg_recipients, :new_recipients)
  end
end
