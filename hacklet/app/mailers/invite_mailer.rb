class InviteMailer < ApplicationMailer
  default from: 'invites@hacklet.org'

  def new(invite, invite_url)
    @invite = invite
    @invite_url = invite_url
    mail to: invite.email, subject: 'New team invitation'
  end

  def existing(invite)
    @invite = invite
    mail to: invite.recipient.email, subject: 'New team invitation'
  end
end
