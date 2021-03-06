Rails.application.routes.draw do
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  post "logout", to: "sessions#destroy"

  get "/home/mycart", to: "foodcarts#mycart"
  get "signup", to: "users#signup"
  post "signup", to: "users#newsignup"

  get "unauthorised", to: "sessions#unauthorized"
  get "/home/Food-Menu", to: "orders#FoodMenu"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, path: "/home/users"

  resources :orders, path: "/home/orders" do
    resources :walkin_orders

    collection do
      post :cancelOrder
      get :updateStatus, path: "/:id/updateOrder"
      put :updateOrder, path: "/:id/updateOrder"
      get :walkinOrder
      get :myorders
      post :add_order_item
      post :add_to_offcart
      delete :clear_cart
      get :checkout
    end
  end

  resources :foodcarts, path: "/home/cart"
  resources :foodcarts_items do
    collection do
      put :increment_item
      put :decrement_item
      put :increment_cart_item
      put :decrement_cart_item
    end
  end

  resources :menu_categories, path: "/home/menu" do
    collection do
      put :updateStatus, path: "/:id/status"
    end
    resources :menu_categories_items, path: "item"
  end
  root "sessions#new"
end
