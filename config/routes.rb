Rails.application.routes.draw do
  resources :categories

  devise_for :users

  devise_scope :user do
    get "/logout" => "devise/sessions#destroy"
  end

  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "application#home"

  get 'cart' => "shopping_cart#index", as: :cart
  get 'cart/add/:id' => 'shopping_cart#add', as: :product_to_cart
  get 'cart/clear' => "shopping_cart#clear", as: :cart_clear
  get "cart/remove/:id" => "shopping_cart#remove", as: :remove_product_from_cart
end
