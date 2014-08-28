require 'httparty'


class FinYah
  attr_accessor :query
  attr_accessor :q
  @@base_uri = 'http://query.yahooapis.com/v1/public/yql'

  def initialize stocks, format: 'json'
    stocks = [stocks] if stocks.class == String
    stock_str = ""

    stocks.each do |s|
      stock_str << "\"#{s}\","
    end
    stock_str = stock_str[0...-1]

    @q = "Select * from yahoo.finance.quotes where symbol in (#{stock_str})"
    q_str = "?q=#{@q}&env=http://datatables.org/alltables.env&format=#{format}"

    @query = URI::encode("#{@@base_uri}#{q_str}")
  end

  def get
    HTTParty.get(self.query)
  end
end
