# Here we define what the cookie passed from the front-end structured like
if Rails.env == "production"
  Rails.application.config.session_store :cookie_store, key:"_authentication_app", domain: "https://HerokuAppNameHere.herokuapp.com"
else
  Rails.application.config.session_store :cookie_store, key:"_authentication_app"
end 
