Rails.application.routes.draw do
  # Health check used by Render and uptime monitors.
  get "up" => "rails/health#show", as: :rails_health_check

  # LCM endpoint. The :email_token segment is required by the task so that
  # the public URL ends with a sanitized email address. Query params x and y
  # carry the two non-negative integers whose lowest common multiple we return.
  get '/lcm/:email_token', to: 'lcm#compute', constraints: { email_token: %r{[^/]+} }
end