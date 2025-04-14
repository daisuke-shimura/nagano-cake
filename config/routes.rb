Rails.application.routes.draw do
#admin
  devise_for :admin, skip: [:registrations, :passwords], controllers:{
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: 'homes#top'
    resources :items, only: [:index, :show, :new, :edit, :create, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    patch 'orders/make/:id' => 'orders#make', as: 'order_make'
  end

#public
  devise_for :customers, skip: [:passwords], controllers:{
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'

    resources :items, only: [:index, :show]

    resources :customers, only: [:show, :edit, :update]
    get 'customers/confirm/:id' => 'customers#confirm', as: 'customer_confirm'
    patch 'customers/quit/:id' => 'customers#quit', as: 'customer_quit'

    delete 'cart_items/all_destroy' => 'cart_items#all_destroy'
    resources :cart_items, only: [:index, :update, :create, :destroy]

    #注文履歴削除（destroy）は要らない
    resources :orders, only: [:index, :new, :show, :create, :destroy]
    get 'orders/confirm/:id' => 'orders#confirm', as: 'order_confirm'
    get 'orders/decision/:id' => 'orders#decision', as: 'order_decision'

    resources :address, only: [:index, :edit, :create, :update, :destroy]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
