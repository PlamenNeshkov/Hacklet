class InviteMailer < ApplicationMailer
  default from: 'invites@hacklet.org'

  def to_new(invite, recipient, invite_url)
    @invite = invite
    @invite_url = invite_url
    mail to: recipient.email, subject: 'New team invitation'
  end

  def to_user(invite, recipient)
    @invite = invite
    mail to: recipient.email, subject: 'New team invitation'
  end
end
