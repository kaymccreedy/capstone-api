Rails.application.routes.draw do
  
  post "/users" => "users#create"

  post "/sessions" => "sessions#create"

  get "/photos" => "photos#index"
  get "/photos/:id" => "photos#show"

  get "/products" => "products#index"
  get "/products/:id" => "products#show"

  get "/orders" => "orders#index"
  get "/orders/:id" => "orders#show"
  post "/orders" => "orders#create"

  get "/images" => "images#index"

end