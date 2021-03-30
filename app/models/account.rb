class Account < ApplicationRecord
  has_many :tweets, dependent: :destroy

  def url
    "https://twitter.com/#{username}"
  end

  def get_recent_tweets!
    options = {
      tweet_mode: :extended,
      count: 100
    }
    options[:since_id] = most_recent_tweet.identifier if most_recent_tweet
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

  def most_recent_tweet
    tweets.ordered.first
  end

  def client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.bearer_token        = ENV['TWITTER_BEARER_TOKEN']
    end
  end
end
