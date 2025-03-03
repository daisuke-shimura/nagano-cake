Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords], controllers:{
    sessions: "admin/sessions"
  }
  devise_for :customers, skip: [:passwords], controllers:{
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  namespace :admin do
    resources :items
    root to: 'items#top'
  end

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'

    resources :items, only: [:index, :show]

    resources :customers, only: [:show, :edit, :update]
    get 'customers/confirm/:id' => 'customers#confirm', as: 'customer_confirm'
    patch 'customers/quit/:id' => 'customers#quit', as: 'customer_quit'

    resources :cart_items, only: [:index, :update, :create, :destroy]
    delete 'all_destroy' => 'cart_items#all_destroy'

    resources :orders, only: [:index, :new, :show, :create, :destroy]
    get 'orders/confirm/:id' => 'orders#confirm', as: 'order_confirm'
    get 'orders/decision/:id' => 'orders#decision', as: 'order_decision'

    resources :address, only: [:index, :edit, :create, :update, :destroy]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
