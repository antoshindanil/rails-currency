# frozen_string_literal: true

class CurrenciesController < ApplicationController
  def index
    @currency = Currency.current_currency
    render :index
  end
end
