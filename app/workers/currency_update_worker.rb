class CurrencyUpdateWorker
  include Sidekiq::Worker

  def perform(*args)
    CurrencyUpdateJob.perform_later
  end
end