Rails.application.routes.draw do
  get '/wines/locations', to: 'wines#locations'
  get '/wines/locations/:user_id', to: 'wines#user_wines_locations'
  get '/wines/info/:id', to: 'wines#info'
  get 'users/info', to: 'users#info'
end
