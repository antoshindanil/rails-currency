# frozen_string_literal: true

class Currency < ApplicationRecord
  UPDATE_TIME = 30.seconds

  validates :name, :value, :expired_in, presence: true
  validates :value, numericality: true

  after_create { CurrencyUpdateWorker.perform_at(Time.current + UPDATE_TIME) }

  def self.current_currency
    if where('"expired_in" > ?', Time.current).exists?
      last
    else
      create(name: "USD/RUB", value: currency_value, expired_in: Time.current + UPDATE_TIME)
    end
  end

  def self.currency_value
    CurrencyApiService.new.call
  end
end
