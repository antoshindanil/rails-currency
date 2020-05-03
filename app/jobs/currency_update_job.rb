class CurrencyUpdateJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Currency.current_currency
  end
end
