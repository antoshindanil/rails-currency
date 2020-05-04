# frozen_string_literal: true

class CurrencyApiService
  def initialize(client: nil)
    @client = client || CurrencyApiClient.new
  end

  def call
    @client.get_course(base_currency: "USD", currency: "RUB")
  end

  def success?
    @client.last_response.status == 201 || 200
  end
end
