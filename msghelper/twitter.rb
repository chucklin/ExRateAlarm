require 'twitter'
require 'psych'

class TwitterHlpr
  def send_msg(msg)
    # load twitter configuration from file
    twitter_conf = Psych.load_file('msghelper/twitter_conf.yml')

    # set global settings
    Twitter.configure do |config|
      config.consumer_key = twitter_conf['consumer_key']
      config.consumer_secret = twitter_conf['consumer_secret']
    end

    # create a new twitter client with user's oauto_token
    user = Twitter::Client.new(
      :oauth_token => twitter_conf['oauth_token'],
      :oauth_token_secret => twitter_conf['oauth_token_secret']
    )

    user.update(msg)
  end
end