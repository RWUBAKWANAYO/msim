# config/initializers/sidekiq_cron.rb
require 'sidekiq-cron'

Sidekiq::Cron::Job.create(
  name: 'Update courses every 30 seconds',
  cron: '*/2 * * * *', # Runs every 30 seconds
  class: 'CourseFetcherWorker',
  args: []
)

