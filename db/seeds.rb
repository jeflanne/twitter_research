# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create! do |user|
  user.full_name = 'Jeff Flannery'
  user.email = 'jflannery@teldargroup.com'
  user.password = "foobar"
  user.password_confirmation = "foobar"
end

Category.create!(title: 'Business')
Category.create!(title: 'WSOP')
Category.create!(title: 'Baseball')
Category.create!(title: 'Hawkeyes')

