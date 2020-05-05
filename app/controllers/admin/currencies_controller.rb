# frozen_string_literal: true

class Admin::CurrenciesController < Admin::BaseController
  def new
    @currency = Currency.last || Currency.new
  end

  def create
    @currency = Currency.new(currency_params)

    if @currency.save
      CurrencyUpdateWorker.perform_at(@currency.expired_in)
      ActionCable.server.broadcast "currency_channel", value: @currency.value
      redirect_to admin_form_path(@currency), notice: 'Rates was successfully updated'
    else
      render :new
    end
  end

  def update
    @currency = Currency.last
    
    if @currency.update(currency_params)
      CurrencyUpdateWorker.perform_at(@currency.expired_in)
      ActionCable.server.broadcast "currency_channel", value: @currency.value
      redirect_to admin_form_path(@currency), notice: "Rates was successfully updated"
    else
      render :new
    end
  end

  private

  def currency_params
    params.require(:currency).permit(:name, :value, :expired_in)
  end
end
