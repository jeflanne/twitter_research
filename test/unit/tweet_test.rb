require 'test_helper'

class TweetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    %w(WSOP Hawkeyes Football Baseball).each do |title|
      Category.create!(title: title)
end
    end
  test("suggested categories works correctly") do
    tweet = Tweet.new do |t|
      t.tweeted_text = "I wish the Hawkeyes #football team would win"
    end
assert_equal("Hawkeyes, Football", tweet.suggested_categories)
  end
end
