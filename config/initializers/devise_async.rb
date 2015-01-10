# Supported options: :resque, :sidekiq, :delayed_job, :queue_classic, :torquebox, :backburner, :que
# config/initializers/devise_async.rb
Devise::Async.setup do |config|
  config.enabled = true
  config.backend = :delayed_job
  config.queue   = :devise_queue
end