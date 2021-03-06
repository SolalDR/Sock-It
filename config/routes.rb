Rails.application.routes.draw do
  root to: "application#home"

  #users
  devise_for :users
  devise_scope :user do
    get "/logout" => "devise/sessions#destroy"
  end
  get "/profile" => "profile#show", as: :profile_show
  get "/profile/edit" => "profile#edit", as: :profile_edit
  patch "profile/update" => "profile#update"
  get "/payments/all" => "payments#index", as: :payments_all_path
  get "/payments/fact" => "payments#edit_fact", as: :payments_fact
  get "/payments/delivery" => "payments#edit_delivery", as: :payments_delivery
  get "/payments/show" => "payments#show", as: :payments_show
  get "/payments/buy" => "payments#new_charge", as: :payments_buy
  get "/payments/destroy" => "payments#destroy", as: :payments_destroy
  get "/payments/success" => "payments#success", as: :payments_success
  post "/payments/charge" => "payments#buy", as: :payments_charge

  get "/shopping/all" => "shopping_cart#all", as: :shopping_all


  resources :payments
  resources :products
  resources :categories


  #shopping_cart
  get 'cart' => "shopping_cart#index", as: :cart
  get 'cart/add/:id' => 'shopping_cart#add', as: :product_to_cart
  get 'cart/clear' => "shopping_cart#clear", as: :cart_clear
  get "cart/remove/:id" => "shopping_cart#remove", as: :remove_product_from_cart
  get "cart/remove/:id/:quantity" => "shopping_cart#remove", as: :remove_products_from_cart


end
