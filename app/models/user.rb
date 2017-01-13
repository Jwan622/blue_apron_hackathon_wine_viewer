class User < ActiveRecord::Base
  has_many :users_wines
  has_many :wines, through: :users_wines

  geocoded_by :address   # can also be an IP address
  after_validation :geocode
end
