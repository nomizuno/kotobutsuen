Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  get 'posts/create'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#popular'

  get 'posts/index'

  get 'top' =>"home#top"
  get "about"=>"home#about"
  get "agreement"=>"home#agreement"
  get "question" => "home#quest"
  get 'posts/index' => "posts#index"
  get 'posts/index_all' => "posts#index_all"

  get 'posts/index/:word' => "posts#word"


  get 'posts/recent' => "posts#recent"
  get 'posts/recent_words' => "posts#recent_words"
  get 'posts/popular' => "posts#popular"

  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"
  get "posts/:id" => "posts#show"
  get "posts/:id/all" => "posts#show_all"
  get "posts/:id/edit" => "posts#edit"

  get "users/:id" => "users#show"
  get "users/:id/edit" => "users#edit"
  post "users/:id/update" =>"users#update"
  get "users/:id/likes" => "users#likes"

  post "comments/:id/create" => "comments#create"
  post "comments/:id/destroy" => "comments#destroy"

  post "likes/:comment_id/create" => "likes#create"
  post "likes/:comment_id/destroy" => "likes#destroy"

  post "likes/:comment_id/create_recent" => "likes#create_recent"
  post "likes/:comment_id/destroy_recent" => "likes#destroy_recent"

end
