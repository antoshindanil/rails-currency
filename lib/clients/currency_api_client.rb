# frozen_string_literal: true

class CurrencyApiClient
  ROOT_ENDPOINT = "https://www.freeforexapi.com"

  def initialize
    @http_client = setup_http_client
  end

  def get_course(base_currency: "USD", currency: "RUB")
    response = @http_client.get("/api/live?pairs=#{base_currency + currency}")
    json = JSON.parse(response.body)
    json["rates"][base_currency + currency]["rate"]
  end

  private
    def setup_http_client
      Faraday.new(url: ROOT_ENDPOINT)
    end
end
