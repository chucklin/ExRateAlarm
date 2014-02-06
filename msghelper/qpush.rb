# encoding: UTF-8
# This is an iOS push notification service named QPush.
# For more information please refer to website: http://qpush.me/
require 'mechanize'
require 'psych'

class QpushHlpr
  def send_msg(msg)
    # load twitter configuration from file
    qpush_conf = Psych.load_file('msghelper/qpush_conf.yml')
    
    agent = Mechanize.new

    pages = agent.post('http://qpush.me/pusher/push_site/',
    {
      "name" => qpush_conf['device_name'],
      "code" => qpush_conf['device_code'],
      "sig" => "",
      "cache" => "false",
      "msg[text]" => msg
    })
  end
end