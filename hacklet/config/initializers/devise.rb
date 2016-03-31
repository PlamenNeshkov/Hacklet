Devise.setup do |config|
  config.mailer_sender = 'no-reply@hacklet.org'
  config.mailer = 'Devise::Mailer'

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.params_authenticatable = true
  config.http_authenticatable = false
  config.http_authenticatable_on_xhr = true
  config.http_authentication_realm = 'Application'
  config.paranoid = true
  config.skip_session_storage = [:http_auth]
  config.clean_up_csrf_token_on_authentication = true
  config.stretches = Rails.env.test? ? 1 : 10

  config.send_password_change_notification = false
  config.allow_unconfirmed_access_for = 0.days
  config.confirm_within = nil
  config.reconfirmable = true
  config.confirmation_keys = [:email]

  config.remember_for = 2.weeks
  config.expire_all_remember_me_on_sign_out = true
  config.extend_remember_period = false

  # TODO: Set once SSL cert is bought
  # Options to be passed to the created cookie. For instance, you can set
  # secure: true in order to force SSL only cookies.
  config.rememberable_options = {}

  config.password_length = 8..72
  config.email_regexp = /\A[^@]+@[^@]+\z/
  config.timeout_in = 30.minutes
  config.lock_strategy = :failed_attempts
  config.unlock_keys = [:email]
  config.unlock_strategy = :both
  config.maximum_attempts = 5
  config.unlock_in = 1.hour
  config.last_attempt_warning = true
  config.reset_password_keys = [:email]
  config.reset_password_within = 24.hours
  config.sign_in_after_reset_password = true

  config.scoped_views = true
  config.default_scope = :user
  config.sign_out_all_scopes = true

  config.navigational_formats = ['*/*', :html]
  config.sign_out_via = :get

  config.secret_key = ENV['DEVISE_SECRET_KEY']
end
