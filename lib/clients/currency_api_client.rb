class CurrencyApiClient
  ROOT_ENDPOINT = "https://api.ratesapi.io/api"

  def initialize
    @http_client = setup_http_client
  end

  def get_course(currency: "RUB", base_currency: "USD")
    response = @http_client.get("/latest?base=#{base_currency}&symbols=#{currency}")
    JSON.parse(response.body)
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end
end
