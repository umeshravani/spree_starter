Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://thewallx.com', 'https://www.thewallx.com', 'localhost:3000'
    resource '*', headers: :any, methods: [:get, :post, :patch, :put, :delete, :options, :head]
  end
end
