class CurrencyUpdateWorker
  include Sidekiq::Worker

  def perform
    CurrencyUpdateJob.perform_later
  end
end