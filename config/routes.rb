Rails.application.routes.draw do
	root "main#index"
	get "posts/logout" => "posts#logout"
	get "users/login" => "users#login"
	get "posts/complete" => "posts#complete"
	get "posts/not_finish" => "posts#not_finish"
	get "posts/not_finish_show/:id" => "posts#not_finish_show"
	post "users/check_login" => "users#check_login"
	resources :posts,:users,:userposts
end
