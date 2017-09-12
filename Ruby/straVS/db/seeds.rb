require 'faker'
require 'uri'


google_uri_builder = 'https://maps.googleapis.com/maps/api/staticmap?size=600x600&sensor=false&path=enc:'



# Seed real users

Team.create(:name => "DBC Supreme", :description => "We eat exercise for breakfast", :location => "San Francisco", :total_wins => 30502, :total_losses => 0)
Team.create(:name => "Challenge Squad", :description => "The other guys", :location => "Scattered", :total_wins => 5, :total_losses => 0)

Game.create(:name => "Face-off!", :description => "The winning or losing team must buy me a burrito.  With french fries inside.", :team_id => 1, :awayteam_id => 2)


jeremy =        ['JRock', 'Sabat', 'jeremysabat@gmail.com', 'SF', 'CA', 'M', 'http://dgalywyr863hv.cloudfront.net/pictures/athletes/7183762/2183281/3/large.jpg', '50f365eddf514cc68c02daf2e8bac40aff13f1a7', '7183762', '1']
jeremy_maps =   ["https://maps.googleapis.com/maps/api/staticmap?size=600x600&sensor=false&path=enc:cepcF~gshVaI%60RiTj[gUpg@wPtYN%60LqsKbnP_i@%60q@%7Bo@tdAa[h[%7D_Ahv@ap@l[%7DaBhkBmRdb@qoBhlGoh@pz@j@JaHlDkz@b_AmcAxs@%7BcAzd@yv@b@uUmBkQ%7BGu%60@aZkcBm%60BuLiGcKqAgP%60D%7BhA~z@yWfI%7DLv@a_B_@%7BzAu]uhDsV_xBre@kOuCyL%7BN%5CuA&key=AIzaSyBS2RujomwKfUyYQveDnGglYovtUDDJLwA", "https://maps.googleapis.com/maps/api/staticmap?size=600x600&sensor=false&path=enc:mnmeFfx_jV%60d@pArdDrVluAh%5Er%7CAt@zRiA%60VgG%7ChAo%7B@%60IyCbMc@~UvJ~cBfaBp[rU%60TlIdTdCjw@QdcA%7Bd@hcAct@teAsdA%7C@iDhOwM~GgKb%7BByfHjGcQxLoThh@_l@jiA%7BfAnRgH%7CPkLloAifAru@mlA~kAa_B%60vBcgCpu@goArJuTn%7DBgeElLoXfN_S%7CZul@&key=AIzaSyBS2RujomwKfUyYQveDnGglYovtUDDJLwA", "https://maps.googleapis.com/maps/api/staticmap?size=600x600&sensor=false&path=enc:eeqeFli%60jVCrBJyB%7BCY%7DEfHyJeN_Ub%5CyEiC&key=AIzaSyBS2RujomwKfUyYQveDnGglYovtUDDJLwA"]
jeremy_distance = [48333, 44251, 1647]

shirley =       ['Shirley', 'Shaw', 'shirleyshaw.is@gmail.com', 'SF', 'CA', 'F', 'http://dgalywyr863hv.cloudfront.net/pictures/athletes/7176220/2184762/1/large.jpg', 'fd32c62d76dd12eadfb4d2a17cf19c2598e2318a', '7176220', '1']
shirley_maps =  ["https://maps.googleapis.com/maps/api/staticmap?size=600x600&sensor=false&path=enc:gyreFf%7D%60jVeG%7CCp@fDnBh@kFzG%7BAnGsEr@%60F%7CDw@rAr@%7D@qAqDkB%5Ea@yArBp[%7BFrI~BhDlGp@y@%7CIdG~s@%60@tg@jNn~AbFv_AZfMqCL&key=AIzaSyBS2RujomwKfUyYQveDnGglYovtUDDJLwA", "https://maps.googleapis.com/maps/api/staticmap?size=600x600&sensor=false&path=enc:kyreFh%7B%60jVaF%7CE%7BCM%7DAtEs@[fDwDxCEI%7DCvEa@AkA&key=AIzaSyBS2RujomwKfUyYQveDnGglYovtUDDJLwA"]
shirley_distance = [6754, 943]

murat =         ['Murat', 'Gocmen', 'Murat.dbc@gmail.com', 'SF', 'CA', 'M', 'http://dgalywyr863hv.cloudfront.net/pictures/athletes/7187014/2174487/1/large.jpg', 'de99b2f1890d6490d7a19a24f65a0c88cf04d506', '7187014', '1']
murat_maps =    ["https://maps.googleapis.com/maps/api/staticmap?size=600x600&sensor=false&path=enc:e%7CreFtl%60jVu@jCaD_D%7B]eg@zReIj%7C@v@mBgAeWhB__@%7BAiGp@%7BKtGrXn]o@r@bGdI&key=AIzaSyBS2RujomwKfUyYQveDnGglYovtUDDJLwA", "https://maps.googleapis.com/maps/api/staticmap?size=600x600&sensor=false&path=enc:qzreF~l%60jVLeAcBlGkEaCcAgEmKcMg@%7DCuGsDV%7B@mC%7DBeAsEvPaIpa@hAfW_BbDdB%60EjMrBeBCuKrAi@eA%60ARjJyC%7CBiEmN%7DA%7D@%7BUfAy%60@oAuTrIta@fl@~DiGc@vB&key=AIzaSyBS2RujomwKfUyYQveDnGglYovtUDDJLwA", "https://maps.googleapis.com/maps/api/staticmap?size=600x600&sensor=false&path=enc:m%7CreFvm%60jVn@KoBvB%7BA%7DA%7B_@gi@rMyH~d@bAlXeBzBpAzDrNvCwBfSm@cXrCeEaNoCqAqP~Ail@k@sMtHpa@hj@xBR&key=AIzaSyBS2RujomwKfUyYQveDnGglYovtUDDJLwA", "https://maps.googleapis.com/maps/api/staticmap?size=600x600&sensor=false&path=enc:s%7CreFtm%60jVkAnCcBiBa_@gj@lT%7BI%60%5EpB~WmBlCvAzDxMdZ%7BCuT%7C@oDrB%7DEsOoAe@eSfBie@%7DAuFp@_KpHfa@tj@xCaB&key=AIzaSyBS2RujomwKfUyYQveDnGglYovtUDDJLwA"]
murat_distance =  [4838, 6427, 6435, 6439]

ethan =         ['Ethan', 'Spiro', 'ethanspiro@gmail.com', 'SF', 'CA', 'M', 'http://dgalywyr863hv.cloudfront.net/pictures/athletes/7175460/2182838/1/large.jpg', '255dfb79ccae694aa17c9b1007526cbcef0b73c1', '7175460', '1']
ethan_maps =    ["https://maps.googleapis.com/maps/api/staticmap?size=600x600&sensor=false&path=enc:gyreFf%7D%60jVeG%7CCp@fDnBh@kFzG%7BAnGsEr@%60F%7CDw@rAr@%7D@qAqDkB%5Ea@yArBp[%7BFrI~BhDlGp@y@%7CIdG~s@%60@tg@jNn~AbFv_AZfMqCL&key=AIzaSyBS2RujomwKfUyYQveDnGglYovtUDDJLwA", "https://maps.googleapis.com/maps/api/staticmap?size=600x600&sensor=false&path=enc:kyreFh%7B%60jVaF%7CE%7BCM%7DAtEs@[fDwDxCEI%7DCvEa@AkA&key=AIzaSyBS2RujomwKfUyYQveDnGglYovtUDDJLwA"]
ethan_distance = [6754, 943]

tim =           ['Tim', 'Sabat', 'timothy.sabat@gmail.com', 'Bend', 'OR', 'M', 'http://dgalywyr863hv.cloudfront.net/pictures/athletes/148007/1091463/2/large.jpg', '89cd44ccfd2e9f3d28be983edaa1262ab283a56d', '148007', '2']
tim_maps =      ["https://maps.googleapis.com/maps/api/staticmap?size=600x600&sensor=false&path=enc:ep%7DkGpclcVdJb@fXlYzDyHtBpA&key=AIzaSyBS2RujomwKfUyYQveDnGglYovtUDDJLwA", "https://maps.googleapis.com/maps/api/staticmap?size=600x600&sensor=false&path=enc:%7Bc%7CkGxulcVbBjCwDjIi@a@&key=AIzaSyBS2RujomwKfUyYQveDnGglYovtUDDJLwA", "https://maps.googleapis.com/maps/api/staticmap?size=600x600&sensor=false&path=enc:au%7CkGn%7DlcV%7BJcByFaOeJzEgB~FeFn@JnEcKmHgRrB%7BG%7DFyDsHeNnFeDaAcKdH%7DYzEaT%60KcYvYkFcA%7DHrDkCtGpB%60EvFfCn@jC%7BCmFwDeAuA%7BDnJeKvINrZwYlZaNnRoBbKmHpDv@lNiF~D%7CI%7CEjEzSeBtIbHx@c@u@aDbEChCyGhJeFdGbNjA@&key=AIzaSyBS2RujomwKfUyYQveDnGglYovtUDDJLwA"]
tim_distance =  [912, 219, 9770]

julian =        ['Julian', 'TheBossMan', 'jugalleg22@yahoo.com', 'SF', 'CA', 'M', 'http://dgalywyr863hv.cloudfront.net/pictures/athletes/3819511/1228892/1/large.jpg', '61991c295e6ee0223e8ac779c80bd9edf980571a', '3819511', '2']
julian_maps =   ["https://maps.googleapis.com/maps/api/staticmap?size=600x600&sensor=false&path=enc:e%7CreFtl%60jVu@jCaD_D%7B]eg@zReIj%7C@v@mBgAeWhB__@%7BAiGp@%7BKtGrXn]o@r@bGdI&key=AIzaSyBS2RujomwKfUyYQveDnGglYovtUDDJLwA", "https://maps.googleapis.com/maps/api/staticmap?size=600x600&sensor=false&path=enc:qzreF~l%60jVLeAcBlGkEaCcAgEmKcMg@%7DCuGsDV%7B@mC%7DBeAsEvPaIpa@hAfW_BbDdB%60EjMrBeBCuKrAi@eA%60ARjJyC%7CBiEmN%7DA%7D@%7BUfAy%60@oAuTrIta@fl@~DiGc@vB&key=AIzaSyBS2RujomwKfUyYQveDnGglYovtUDDJLwA", "https://maps.googleapis.com/maps/api/staticmap?size=600x600&sensor=false&path=enc:m%7CreFvm%60jVn@KoBvB%7BA%7DA%7B_@gi@rMyH~d@bAlXeBzBpAzDrNvCwBfSm@cXrCeEaNoCqAqP~Ail@k@sMtHpa@hj@xBR&key=AIzaSyBS2RujomwKfUyYQveDnGglYovtUDDJLwA", "https://maps.googleapis.com/maps/api/staticmap?size=600x600&sensor=false&path=enc:s%7CreFtm%60jVkAnCcBiBa_@gj@lT%7BI%60%5EpB~WmBlCvAzDxMdZ%7BCuT%7C@oDrB%7DEsOoAe@eSfBie@%7DAuFp@_KpHfa@tj@xCaB&key=AIzaSyBS2RujomwKfUyYQveDnGglYovtUDDJLwA"]
julian_distance = [4838, 6427, 6435, 6439]

alex =          ['Alex', 'Vasquez', 'alex.quez@gmail.com', 'SF', 'CA', 'M', 'http://dgalywyr863hv.cloudfront.net/pictures/athletes/3495784/2184831/2/large.jpg', 'd8c170174683a2f8927c26241ec7aefb7adb96a4', '3495784', '2']
alex_maps =     ["https://maps.googleapis.com/maps/api/staticmap?size=600x600&sensor=false&path=enc:ykpcFreshVs@fAqFsGhFhG%60BwAt@tA&key=AIzaSyBS2RujomwKfUyYQveDnGglYovtUDDJLwA"]
alex_distance = [349]

chris =         ['Chris', 'Dubois', 'chris.dubois@gmail.com', 'Portland', 'OR', 'M', 'http://dgalywyr863hv.cloudfront.net/pictures/athletes/773873/2184793/2/large.jpg', 'e55d97c7864f3d3830583de1e861b5b0a5cc5237', '773873', '2']
chris_maps =    ["https://maps.googleapis.com/maps/api/staticmap?size=600x600&sensor=false&path=enc:ykpcFreshVs@fAqFsGhFhG%60BwAt@tA&key=AIzaSyBS2RujomwKfUyYQveDnGglYovtUDDJLwA"]
chris_distance = [349]


people = [jeremy, shirley, murat, ethan, tim, julian, alex, chris]
maps = [jeremy_maps, shirley_maps, murat_maps, ethan_maps, tim_maps, julian_maps, alex_maps, chris_maps]
distance = [jeremy_distance, shirley_distance, murat_distance, ethan_distance, tim_distance, julian_distance, alex_distance, chris_distance]

people.each do |person|
  User.create(:firstname => person[0], :lastname => person[1], :email => person[2], :city => person[3], :state => person[4], :sex => person[5],
    :profile_img => person[6], :token => person[7], :strava_id => person[8], :team_id => person[9])
end

maps.each_with_index do |map, i|
  map.each_with_index do |polyline, n|
    User.find(i + 1).activities.create(:user_id => (i + 1), :map_polyline => polyline, :distance => distance[i][n], :date_of_activity => Faker::Date.forward(7))
  end
end




15.times do
  TeamChat.create(:content => Faker::Lorem.sentence, :user_id => User.all.sample.id)
end

15.times do
  TrashTalk.create(:game_id => Game.all.sample.id, :user_id => User.all.sample.id, :content => Faker::Lorem.sentence)
end






# Robot seed data

# google_uri_builder = 'https://maps.googleapis.com/maps/api/staticmap?size=600x600&sensor=false&path=enc:'

Team.create(:name => "test team 1", :description => "team 1 description", :location => "team 1 location", :total_wins => 3, :total_losses => 5)
Team.create(:name => "test team 2", :description => "team 2 description", :location => "team 2 location", :total_wins => 3, :total_losses => 5)
Team.create(:name => "test team 3", :description => "team 3 description", :location => "team 3 location", :total_wins => 3, :total_losses => 5)
Team.create(:name => "test team 4", :description => "team 4 description", :location => "team 4 location", :total_wins => 3, :total_losses => 5)

        # # GameInvite.create(:team_id => 1, :invite_from_id => 2)
        # # GameInvite.create(:team_id => 3, :invite_from_id => 4)

Game.create(:name => "first test game", :description => "first game description", :team_id => 3, :awayteam_id => 4)
Game.create(:name => "second test game", :description => "second game description", :team_id => 5, :awayteam_id => 6)

4.times do
  User.create(:strava_name => Faker::Lorem.word, :firstname => Faker::Name.first_name, :lastname => Faker::Name.last_name, :email => Faker::Internet.email, :city => Faker::Address.city, :state => Faker::Address.state, :sex => "M",
    :profile_img => Faker::Avatar.image, :token => '61991c295e6ee0223e8ac779c80bd9edf980571a', :strava_id => Faker::Number.number(4), :team_id => 3)
end

4.times do
  User.create(:strava_name => Faker::Lorem.word, :firstname => Faker::Name.first_name, :lastname => Faker::Name.last_name, :email => Faker::Internet.email, :city => Faker::Address.city, :state => Faker::Address.state, :sex => "M",
    :profile_img => Faker::Avatar.image, :token => '50f365eddf514cc68c02daf2e8bac40aff13f1a7', :strava_id => Faker::Number.number(4), :team_id => 4)
end
4.times do
  User.create(:strava_name => Faker::Lorem.word, :firstname => Faker::Name.first_name, :lastname => Faker::Name.last_name, :email => Faker::Internet.email, :city => Faker::Address.city, :state => Faker::Address.state, :sex => "M",
    :profile_img => Faker::Avatar.image, :token => '255dfb79ccae694aa17c9b1007526cbcef0b73c1', :strava_id => Faker::Number.number(4), :team_id => 5)
end
4.times do
  User.create(:strava_name => Faker::Lorem.word, :firstname => Faker::Name.first_name, :lastname => Faker::Name.last_name, :email => Faker::Internet.email, :city => Faker::Address.city, :state => Faker::Address.state, :sex => "M",
    :profile_img => Faker::Avatar.image, :token => 'fd32c62d76dd12eadfb4d2a17cf19c2598e2318a', :strava_id => Faker::Number.number(4), :team_id => 6)
end

50.times do
  Activity.create(:user_id => [9..24].sample, :map_polyline => URI.escape(google_uri_builder + "cepcF~gshVaI`RiTj[gUpg@wPtYN`LqsKbnP_i@`q@{o@tdAa[h[}_Ahv@ap@l[}aBhkBmRdb@qoBhlGoh@pz@j@JaHlDkz@b_AmcAxs@{cAzd@yv@b@uUmBkQ{Gu`@aZkcBm`BuLiGcKqAgP`D{hA~z@yWfI}Lv@a_B_@{zAu]uhDsV_xBre@kOuCyL{N\\uA" + "&key=#{ENV['GOOGLEAPI']}"), :distance => Random.rand(200), :date_of_activity => Faker::Date.forward(7))
end

30.times do
  TeamChat.create(:content => Faker::Lorem.sentence, :user_id => [9..24].sample)
end

30.times do
  TrashTalk.create(:game_id => [3,4,5,6].sample, :user_id => [9..24].sample, :content => Faker::Lorem.sentence)
end






