Rails.application.routes.draw do
	resources :posts,:users
	get "users/login" , to: "users#show"
end
