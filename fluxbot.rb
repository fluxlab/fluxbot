# encoding: UTF-8
require 'chatterbot/dsl'
require 'yaml'

# reply to @mentions
def reply_to_mentions
  replies do |tweet|
    # TODO: decide what the bot should really do when users @mention
    # it
    text = "#USER# I'm a bot!"
    reply text, tweet
  end
end

def tweet_events
  # TODO: tweet changes to the calendar and any upcoming events
end

def tweet_manual_queue
  # TODO: some mechanism for queueing manual tweets
end

loop do
  begin
    reply_to_mentions
    tweet_events
    tweet_manual_queue
    sleep 90
  rescue Twitter::Error::TooManyRequests
    sleep 1000
  end
end
