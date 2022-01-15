# Cors gives you the ability to whitelist certain domains

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origin "http://localhost:3000/"
  end
end
