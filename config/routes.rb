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
    get 'confirm/:id' => 'customers#confirm', as: 'confirm'
    patch 'quit/:id' => 'customers#quit', as: 'quit'

    resources :cart_items, only: [:index, :update, :create]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
