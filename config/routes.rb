Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "users#home"
  get "/home" => "users#home"
  get "/select_user/:id" => "users#select_user"
  # get "/new_boat_js" => "boats#new_boat_js"
  get "/check_status" => "jobs#check_status"
  post "/check_status" => "jobs#check_status"
  get "/search" => "jobs#index"

  devise_for :users
  resources :users, :only => [:index, :show]

  resources :airports
  resources :jobs

  resources :airplanes
  resources :photos	# use this version if editing title, description, other db values


end
