# frozen_string_literal: true

class CurrencyUpdateJob < ApplicationJob
  queue_as :default

  def perform
    currency = Currency.current_currency
    ActionCable.server.broadcast "currency_channel", value: currency.value
  end
end
