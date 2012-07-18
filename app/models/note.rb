class Note < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible(:note_text)
  validates(:note_text, :presence => true)
  belongs_to(:user)
  belongs_to(:tweet)
end
