# ExRateAlarm
## DESCRIPTION
Use to parse the exchange rate from bank webpage then send a notification.

## TO USE
1. Configure the notification method you'd like to use
>for example: copy qpush_conf.yml.sample to qpush_conf.yml under msghelper folder and fill in the related information.
2. Use **bundle install** to install required RubyGems
3. Modify main.rb for your own use
4. Just execute **ruby main.rb**

**You may use this script with crontab to check the rate periodically.**