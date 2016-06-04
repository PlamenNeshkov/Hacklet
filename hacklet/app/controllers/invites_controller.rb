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
        user = User.find_by_email(email)
        if user == nil
          flash[:notice] = "You must enter a valid user";
          redirect_to new_invite_path(id: invite_params[:team_id]) and return
        elsif current_user == user
          flash[:notice] = "You can't invite yourself";
          redirect_to new_invite_path(id: invite_params[:team_id]) and return
        else
          recipient = Recipient.create(email: email, accepted: false)
          @invite.recipients.push(recipient)
        end
      end
    elsif recipient_params[:new_recipients]
      recipient_params[:new_recipients].split(', ').each do |email|
        if current_user.email == email
          flash[:notice] = "You can't invite yourself";
          redirect_to new_invite_path(id: invite_params[:team_id]) and return
        end

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

  def invite_params
    params.require(:invite).permit(:team_id)
  end

  def recipient_params
    params.require(:invite).permit(:reg_recipients, :new_recipients)
  end
end
