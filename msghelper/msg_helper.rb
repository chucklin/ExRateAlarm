require './msghelper/qpush.rb'
require './msghelper/twitter.rb'

def get_msg_helper(name)
  if name == "twitter"
    return TwitterHlpr.new
  elsif name == "qpush"
    return QpushHlpr.new
  end
end