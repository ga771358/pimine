Rails.application.routes.draw do
	root "main#index"
	get "posts/logout" => "posts#logout"
	get "users/login" => "users#login"
	post "users/check_login" => "users#check_login"
	resources :posts,:users
end
