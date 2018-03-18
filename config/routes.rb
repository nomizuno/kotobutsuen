Rails.application.routes.draw do
  get 'posts/create'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#top'

  get 'posts/index'

  get '' =>"home#top"
  get "about"=>"home#about"
  get 'posts/index' => "posts#index"
  get 'posts/recent' => "posts#recent"
  get 'posts/popular' => "posts#popular"

  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"
  get "posts/:id" => "posts#show"
  get "posts/:id/all" => "posts#show_all"
  get "posts/:id/edit" => "posts#edit"

  get "users/:id" => "users#show"
  get "users/:id/edit" => "users#edit"
  post "users/:id/update" =>"users#update"

  post "comments/:id/create" => "comments#create"
  post "comments/:id/destroy" => "comments#destroy"

  post "likes/:comment_id/create" => "likes#create"
  post "likes/:comment_id/destroy" => "likes#destroy"

end
