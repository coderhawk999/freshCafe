Rails.application.routes.draw do
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, path: "/home/users"
  resources :orders, path: "/home/orders" do
    collection do
      post :add_order_item
      delete :clear_cart
      get :checkout
    end
  end
  resources :foodcarts, path: "/home/cart"
  resources :foodcarts_items do
    collection do
      put :increment_item
      put :decrement_item
    end
  end

  resources :menu_categories, path: "/home/menu" do
    resources :menu_categories_items, path: "item"
  end
  root "home#index"
end
