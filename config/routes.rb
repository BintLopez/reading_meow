Rails.application.routes.draw do
  devise_for :users
	root to: "home#index"
  get "home/index"
  match 'home', to: "home#index", via: :all
end
