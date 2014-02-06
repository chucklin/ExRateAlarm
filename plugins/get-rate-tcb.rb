require './plugins/get-rate'

class GetRateTcb < GetRate
  def initialize()
    super("http://www.tcb-bank.com.tw/finance_info/Pages/foreign_spot_rate.aspx", "utf-8")
  end
  
  def getRate(currency)
    table = @doc.xpath("//table[@id='ctl00_PlaceHolderEmptyMain_PlaceHolderMain_fecurrentid_gvResult']")
    
    table.search('tr').each do |tr|
      next if tr.nil?
      
      td = tr.search('td').first
      next if td.nil?

      if td.text.strip.end_with?(currency)
        td = tr.search('td')[2]
        return td.text.strip
      end
    end
  end
end