Rails.configuration.stripe = {
  :publishable_key => ENV['PUBLISHABLE_KEY'],
  :secret_key      => ENV['SECRET_KEY'],
  :client_id => ENV['CLIENT_ID']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]

