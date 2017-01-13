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
end
