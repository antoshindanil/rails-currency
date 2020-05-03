# frozen_string_literal: true

class Currency < ApplicationRecord
  validates :name, :value, presence: true

  UPDATE_TIME = 5.minutes

  def self.current_currency
    if where('"expired_in" > ?', Time.current).exists?
      last
    else
      create(name: 'USD-RUB', value: currency_value, expired_in: Time.current + UPDATE_TIME)
    end
  end

  def self.currency_value
    service = CurrencyApiService.new
    service.call
  end
end
