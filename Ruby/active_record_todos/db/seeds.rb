require 'faker'

40.times do
  Task.create(:description => Faker::Lorem.sentence, :is_complete => false)
end
