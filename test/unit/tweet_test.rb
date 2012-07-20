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
    assert_equal("Football, Hawkeyes", tweet.suggested_categories)
  end
  def test_setting_categories_from_a_string
    tweet = Tweet.new
    cat = Category.where(title: "Hawkeyes").first
    assert(cat)

    tweet.categories << cat
    assert_equal(1, tweet.categories.size)

    tweet.categories_as_string = "Baseball, Football"
    assert_equal(2,tweet.categories.size)
    assert_equal(%w(Baseball Football), tweet.categories.map(&:title).sort)
  end
end
