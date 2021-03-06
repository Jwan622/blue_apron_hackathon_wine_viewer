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
      puts "updating wine id: #{wine.id}"

      Geocoder.configure(
        # geocoding service (see below for supported options):
        :lookup => :bing,
        # IP address geocoding service (see below for supported options):
        :ip_lookup => :maxmind,
        # to use an API key:
        :api_key => "8zzLbYOWLzXNCzc69OhF~YIfgOM3jSbpSP_IUG-B4Mw~Aq78i5uADiRYvDa-o570jJ-cetnaGD6cYk0RtIE28tAOvmePIH4WwleYpdflV7Yj",
        # geocoding service request timeout, in seconds (default 3):
        :timeout => 5,
        # set default units to kilometers:
        :units => :km,
        # caching (see below for details):
        :cache_prefix => ""
      )

      coordinates = if Geocoder.coordinates(wine.region)
        Geocoder.coordinates(wine.region)
      else
        Geocoder.configure(lookup: :google, api_key: "AIzaSyAOM0HeN0_Ue30RgDH9JTZcu-9IIthP64M", use_https: true)
        Geocoder.coordinates(wine.region)
      end
      wine.update_attributes(latitude: coordinates[0], longitude: coordinates[1]) if coordinates.present?
    end
  end
end
