# Fill the DB with some instances we can use
puts "Cleaning the DB..."
Restaurant.destroy_all

CHEFS = %w[Axel Jed Remy Chris Arnold Prachi Yuki Adi Aayush Aliya Patrick Jason Yu Martin Rafaela]

puts "Creating #{CHEFS.count} Restaurants..."
CHEFS.shuffle.each do |name|

  restaurant_name = Faker::Restaurant.unique.name
  Restaurant.create!(
    name: "#{name}'s #{restaurant_name}",
    rating: rand(3..5),
    address: "日本, 〒153-0063 東京都目黒区 目黒#{rand(1..3)}丁目#{rand(1..10)}番#{rand(1..3)}号"
  )
end
puts "... created #{Restaurant.count} restaurants"
