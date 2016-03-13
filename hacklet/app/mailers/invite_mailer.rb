class InviteMailer < ApplicationMailer
  default from: 'invites@hacklet.org'

  def send_to_new_user(invite, invite_url)
    @invite = invite
    @invite_url = invite_url
    mail(to: invite.email, subject: 'Invitation')
  end

  def send_to_existing_user(invite)
    @invite = invite
    # TODO: It should find the user mail by recipient_id provided
    mail(to: invite.email, subject: 'Invitation')
  end
end
