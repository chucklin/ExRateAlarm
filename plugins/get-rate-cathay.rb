require './plugins/get-rate'

class GetRateCathay < GetRate
  @@MAPPING = {
    'USD' => 'US Dollars',
    'CNY' => 'Chinese Yuan',
    'HKD' => 'Hong Kong Dollars',
    'GBP' => 'Pound Sterling',
    'CHF' => 'Swiss Francs',
    'AUD' => 'Australian Dollars',
    'SGD' => 'Singapore Dollars',
    'CAD' => 'Canadian Dollars',
    'SEK' => 'Swedish Kronor',
    'ZAR' => 'South African Rand',
    'JPY' => 'Japanese Yen',
    'DKK' => 'Danish Kroner',
    'THB' => 'Thai Baht',
    'NZD' => 'New Zealand Dollars',
    'EUR' => 'Euro'
  }
  
  def initialize()
    super("https://www.cathaybk.com.tw/cathaybk/personal_info07.asp", "big5")
  end
  
  def getRate(currency)
    @doc.search('tr').each do |tr|
      td = tr.search('td').first
      next if td.nil?
      
      if td.text.strip.end_with?(@@MAPPING[currency])
        td = tr.search('td')[2]
        return td.text.strip
      end
    end
  end
end