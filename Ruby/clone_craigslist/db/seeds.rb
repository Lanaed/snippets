require 'faker'

10.times do
  Category.create(:name => Faker::Company.name)
end

40.times do
  Article.create(:title => Faker::Company.name, :price => 5.0, :description => Faker::Company.catch_phrase, :category_id => Category.all.sample.id)
end

Article.all.each {|art| art.get_secret_key}
