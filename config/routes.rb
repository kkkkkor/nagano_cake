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
    get 'orders/show'
    resources :customers, only: [:index, :show, :edit, :update]
    get 'items/new'
     resources :items
    root to: 'homes#top'
    get 'homes/top'
    resources :genres, only: [:index, :create, :edit, :update]
  end

  scope module: :public do
    resources :shipping_addresses

    resources :items, only: [:index, :show]

    resources :customers
  end

  scope module: :public do
  resources :cart_items do
    collection do
    delete 'destroy_all'
    end
  end
  end
  scope module: :public do
  resources :orders do
    collection do
    post 'confirm'
    get 'thanks'
    end
  end
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
