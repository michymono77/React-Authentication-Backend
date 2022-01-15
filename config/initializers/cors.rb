# Cors gives you the ability to whitelist certain domains
# credentials true will allow you to pass front-end cookie to backend

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origin "http://localhost:3000/"
    resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head],
    credentials: true
  end

  allow do
    origin "https://HerokuAppNameHere.herokuapp.com"
    resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head],
    credentials: true
  end
end
