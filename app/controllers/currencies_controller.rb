# frozen_string_literal: true

class CurrenciesController < ApplicationController
  def index
    @currency = Currency.currency_value
    render json: @currency
  end
end
