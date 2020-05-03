# frozen_string_literal: true

class CurrenciesController < ApplicationController
  def index
    @currency = Currency.current_currency
    render json: @currency
  end
end
