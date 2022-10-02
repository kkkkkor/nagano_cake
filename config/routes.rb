Rails.application.routes.draw do


  # devise_for :customers
  # devise_for :admins
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
# devise_for :admin, controllers: {
#   sessions: "admin/sessions"
# }
  # devise_for :customers
  namespace :admin do
    get 'order_products/updete'
  end
  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    # get 'customers/index'
    # get 'customers/show'
    # get 'customers/edit'
    # get 'customers/update'
  end
  namespace :admin do
    get 'items/new'
     resources :items
  end
  namespace :admin do
    root to: 'homes#top'
    get 'homes/top'
    resources :genres, only: [:index, :create, :edit, :update]
  end


  namespace :piblic do
    get 'shipping_addresses/index'
    get 'shipping_addresses/edit'
    get 'shipping_addresses/create'
    get 'shipping_addresses/update'
    get 'shipping_addresses/destroy'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/confirm'
    get 'orders/thanks'
    get 'orders/create'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'cart_items/index'
    get 'cart_items/update'
    get 'cart_items/destroy'
    get 'cart_items/all_destroy'
    get 'cart_items/create'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/quit'
    get 'customers/out'
  end

  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  # namespace :public do
  #   root to: 'homes#top'
  #   get 'homes/top'
  #   get 'homes/about'
  # end
   scope module: :public do
    root to: 'homes#top'
    # get 'homes/top'
    get 'homes/about'

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
