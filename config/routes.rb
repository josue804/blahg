Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  post 'posts/create' => 'posts#create'

  resources :posts do
    resources :tags
  end

  resources :tags do
    resources :posts
  end
end
