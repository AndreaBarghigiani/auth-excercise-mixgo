Rails.application.routes.draw do
  resources :posts
  get 'dashboards/index', as: :dashboards
	# resources :dashboards, only: %i[index posts] 
	resources :logins, only: %i[new create]
	resources :registrations, only: %i[new create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
