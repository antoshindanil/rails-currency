# frozen_string_literal: true

class Currency < ApplicationRecord
  validates :name, :value, presence: true

  def self.current_currency
    service = CurrencyApiService.new
    request = service.call
    request['rates']['RUB'].to_f
  end
end
