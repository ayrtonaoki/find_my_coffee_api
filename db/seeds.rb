require 'faker'

puts "Cleaning up old data..."
Rating.delete_all
Store.delete_all

puts "Creating stores..."

stores = 5.times.map do
  Store.create!(
    name: Faker::Company.name,
    address: Faker::Address.full_address,
    google_place_id: Faker::Alphanumeric.alpha(number: 20),
    lonlat: "POINT(#{Faker::Address.longitude} #{Faker::Address.latitude})"
  )
end

puts "Creating ratings..."

stores.each do |store|
  rand(3..8).times do
    Rating.create!(
      store: store,
      value: rand(1..5),
      opinion: Faker::Lorem.sentence(word_count: 8),
      user_name: Faker::Name.first_name
    )
  end
end

puts "Seeding completed successfully!"
