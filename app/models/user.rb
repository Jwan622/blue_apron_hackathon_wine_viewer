class User < ActiveRecord::Base
  has_many :users_wines
  has_many :wines, through: :users_wines
end
