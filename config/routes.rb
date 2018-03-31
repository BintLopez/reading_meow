Rails.application.routes.draw do
	devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register', edit: 'settings' }

	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root to: 'application#home'

	get '/home', to: 'application#home', as: 'home'
	get '/dashboard', to: 'application#dashboard', as: 'dashboard'
end