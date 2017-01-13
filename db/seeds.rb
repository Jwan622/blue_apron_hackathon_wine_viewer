
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "creating wines"

CSV.foreach("#{Rails.root}/db/wines.csv", headers: true) do |row|
  attributes = {}
  attributes[:id] = row['id']
  attributes[:name] = row['name']
  attributes[:year] = row['year']
  attributes[:description] = row['description']
  attributes[:alcohol_by_volume] = row['alcohol_by_volume']
  attributes[:oak] = row['oak']
  attributes[:soil] = row['soil']
  attributes[:min_serve_temperature] = row['min_serve_temperature']
  attributes[:max_serve_temperature] = row['max_serve_temperature']
  attributes[:fun_facts] = row['fun_facts']
  attributes[:aromas] = row['aromas']
  attributes[:taste] = row['taste']
  attributes[:fruit] = row['fruit']
  attributes[:earth] = row['earth']
  attributes[:body] = row['body']
  attributes[:acid] = row['acid']
  attributes[:tannins] = row['tannins']
  attributes[:alcohol] = row['alcohol']
  attributes[:sweetness] = row['sweetness']
  attributes[:classic_pairings] = row['classic_pairings']
  attributes[:label_image] = row['label_image']
  attributes[:bottle_image] = row['bottle_image']
  attributes[:vineyard] = row['vineyard']
  attributes[:appearance] = row['appearance']
  attributes[:region] = row['region']
  attributes[:farming] = row['farming']
  attributes[:lifestyle_image] = row['lifestyle_image']
  attributes[:profile] = row['profile']
  attributes[:tasting_tip] = row['tasting_tip']
  attributes[:appearance_description] = row['appearance_description']
  attributes[:region_description] = row['region_description']

  Wine.create(attributes) unless Wine.where(id: attributes['id']).present?
end

puts "creating users"

CSV.foreach("#{Rails.root}/db/user.csv", headers: true) do |row|
  attributes = {}
  attributes[:id] = row['id']
  attributes[:name] = row['name']
  attributes[:address] = row['address']
  attributes[:latitude] = row['latitude']
  attributes[:longitude] = row['longitude']

  puts "creating user with id: #{attributes[:id]}"
  User.create(attributes)
end

CSV.foreach("#{Rails.root}/db/user_wine.csv", headers: true) do |row|
  attributes = {}
  attributes[:user_id] = row['user_id']
  attributes[:wine_id] = row['wine_id']

  UsersWine.create(attributes) unless UsersWine.where(user_id: row['user_id']).present? && UsersWine.where(wine_id: row['wine_id']).present?
end
