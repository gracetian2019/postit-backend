Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :comments
      resources :posts
      resources :users
      patch "/posts/:id/likes", to: "posts#likes"
      patch "/posts/:id/unlikes", to: "posts#unlikes"
      post "/posts/:id/comment", to: "posts#comment"
      post "/signup", to: "users#create"
      post "/login", to: "users#login"
      # get "/persist", to: "user#persist"
    end
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
