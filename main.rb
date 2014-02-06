# encoding: UTF-8
require './plugins/get-rate-cathay'
require './msghelper/msg_helper.rb'

rate = GetRateCathay.new
usd_rate = rate.getRate("USD")
jpy_rate = rate.getRate("JPY")

msg = ""

if usd_rate.to_f < 30.0
  msg += "TWD -> USD: #{usd_rate}\n"
end

if jpy_rate.to_f < 0.30
  msg += "TWD -> JPY: #{jpy_rate}\n"
end

if not msg.empty?
  msg += "##{Time.now}"
  
  msgHlpr = get_msg_helper("qpush")
  msgHlpr.send_msg(msg)
end