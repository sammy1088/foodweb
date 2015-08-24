Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "API_KEY", "API_SECRET"
  provider :facebook, "169665813364382", "45e3eb875e9599268e96206ffbef8512"
end