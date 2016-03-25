# http://localhost:3000/rails/mailers/invite_mailer
class InviteMailerPreview < ActionMailer::Preview
  # http://localhost:3000/rails/mailers/invite_mailer/new
  def new
    InviteMailer.new
  end

  # http://localhost:3000/rails/mailers/invite_mailer/existing
  def existing
    InviteMailer.existing
  end
end
