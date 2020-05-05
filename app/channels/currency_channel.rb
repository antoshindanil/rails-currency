class CurrencyChannel < ApplicationCable::Channel
  def subscribed
    stream_from "currency_channel"
  end
end
