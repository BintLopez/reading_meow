Rails.application.routes.draw do
  get '/home', to: 'application#home', as: 'home'
end
