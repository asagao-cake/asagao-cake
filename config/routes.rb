Rails.application.routes.draw do
  get '/' => 'public/homes#top', as: "root"
  devise_for :customers, path: 'customer'
  scope module: :public do
    get '/homes/about' => 'homes#about'
    resource :customers, only: [:edit, :update]
    get '/customers/unsubscribe' => 'customers#unsubscribe'
    patch '/customers/quit' => 'customers#quit_update'
    get '/customers/my_page' => 'customers#show'
    resources :cart_items, only: [:create, :destroy, :update]
    get '/cart_items' => 'cart_items#cart'
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :orders, only: [:new, :create, :show, :index]
    post '/orders/confirm' => 'orders#confirm'
    get '/orders/complete' => 'orders#order_comlete'
    resources :items, only: [:index, :show]
    resources :shipping_addresses, only: [:index, :create, :destroy, :edit, :update]
  end

  devise_for :admins
  namespace :admin do
    devise_for :admins, skip: :all
    devise_scope :admin do
      get '/sign_in' => 'sessions#new'
      post '/sign_in' => 'sessions#create'
      delete '/sign_out' => 'sessions#destroy'
    end
    get '' => 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]
    # patch 'admin/order_details/:id' => 'admin_order_details#update'
    resources :items, except: [:destroy]
    resources :genres, only: [:create, :index, :edit, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
