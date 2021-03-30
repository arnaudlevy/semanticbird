class Account < ApplicationRecord
  has_many :tweets

  def url
    "https://twitter.com/#{username}"
  end

  def get_recent_tweets!
    options = { tweet_mode: :extended }
    timeline = client.user_timeline username, options
    timeline.each do |t|
      tweet = tweets.where(identifier: t.id).first_or_initialize
      tweet.create_from_object t
    end
  end

  def to_s
    "#{name}"
  end

  protected

  def client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
    end
  end
end
