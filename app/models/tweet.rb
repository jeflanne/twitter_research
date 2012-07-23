class Tweet < ActiveRecord::Base
  # attr_accessible :title, :body

  attr_accessible(:twitter_user, :tweeted_text, :tweeted_at)
  validates(:twitter_user, :presence => true)
  validates(:tweeted_text, :presence => true)
  validates(:tweeted_at, :presence => true)
  belongs_to(:user)
  has_and_belongs_to_many(:categories)
  def suggested_categories
    # Array#join
    # String#split
    # String#downcase
    #tweeted_text.split
    # a = tweeted_text.split
    text = tweeted_text.gsub(/#/, '').downcase.split.sort
    titles = Category.all.map(&:title).map(&:downcase)

    c = text & titles

    c.map(&:capitalize).sort.join(', ')
  end
  # Returns a comma separated string of the current category titles.
  def categories_as_string
categories.map(&:title).sort.join(', ')
  end
  # Given a comma separated string of category titles, reset the categories for
  # this tweet to the categories in the string.
  def categories_as_string= (new_categories)
    categories.clear
    new_categories.split(/\s*,\s*/).each do |title|
      cat = Category.where('LOWER(title) = ?', title.downcase).first
      categories << cat if !cat.nil?

    end
  end
end
