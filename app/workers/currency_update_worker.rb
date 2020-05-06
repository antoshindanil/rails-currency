# frozen_string_literal: true

class CurrencyUpdateWorker
  include Sidekiq::Worker

  def perform
    CurrencyUpdateJob.perform_later
  end
end
