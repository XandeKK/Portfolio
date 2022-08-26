Clearance.configure do |config|
  config.mailer_sender = ENV["EMAIL"]
  # config.cookie_expiration = lambda { 1.hours.from_now.utc }
  config.rotate_csrf_on_sign_in = true
  config.routes = false
end
