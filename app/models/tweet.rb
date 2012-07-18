class Tweet < ActiveRecord::Base
  # attr_accessible :title, :body

  attr_accessible(:twitter_user, :tweeted_text, :tweeted_at, :user_id)
  validates(:twitter_user, :presence => true)
  validates(:tweeted_text, :presence => true)
  validates(:tweeted_at, :presence => true)
  validates(:user_id, :presence => true)
  belongs_to(:user)
  has_and_belongs_to_many(:categories)
  def suggested_categories
    # Array#join
    # String#split
    # String#downcase
    #tweeted_text.split
    # a = tweeted_text.split
    text = tweeted_text.gsub(/#/, '').split(/\s+/)
    titles = Category.all.map(&:title).map(&:downcase)

    titles.include?(a.each)
    a.join
  end
end
