namespace :db do
  desc "after the geolocator jobs finish, it's safe to run this task."
  task link_wines_and_users: :environment do
    CSV.foreach("#{Rails.root}/db/user_wine.csv", headers: true) do |row|
      attributes = {}
      attributes[:user_id] = row['user_id']
      attributes[:wine_id] = row['wine_id']

      UsersWine.create(attributes) unless UsersWine.where(user_id: row['user_id']).present? && UsersWine.where(wine_id: row['wine_id']).present?
    end
  end

  task export_user_csv_with_addresses: :environment do
    csv = CSV.read("#{Rails.root}/db/user.csv", headers: true, col_sep: ",")

    csv.each do |row|
      address = User.find(row['id'])
      row["latitude"] = address.latitude
      row["longitude"] = address.longitude
    end

    CSV.open("#{Rails.root}/db/user.csv", "w") do |file|
      file << csv.headers
      csv.each { |row| file << row }
    end
  end

  task geolocate_wine: :environment do
    Wine.find_each do |wine|
      Geocoder.configure(lookup: :google, api_key: "AIzaSyAOM0HeN0_Ue30RgDH9JTZcu-9IIthP64M", use_https: true)
      coordinates = Geocoder.coordinates(wine.region)
      puts "Updating wine id: #{wine.id}"
      wine.update_attributes(latitude: coordinates[0], longitude: coordinates[1])
    end
  end
end
