# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'



20.times do
  Question.create(:title => Faker::Company.catch_phrase + "?", :body => Faker::Lorem.sentence, :view_count => 10)
end

50.times do
  Answer.create(:body => Faker::Lorem.sentence, :question_id => Question.all.sample.id)
end

dir = [-1, 1]
200.times do
  Vote.create(:voteable_id => Question.all.sample.id, :voteable_type => "Question", :direction => dir.sample)
  Vote.create(:voteable_id => Answer.all.sample.id, :voteable_type => "Answer", :direction => dir.sample)
end
