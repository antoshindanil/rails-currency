class CurrencyUpdateJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Currency.update
  end
end
