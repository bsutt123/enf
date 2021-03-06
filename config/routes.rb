Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  devise_scope :user do
    match 'sessions/user', to: 'users/sessions#create', via: :post
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'welcome/index'
  root 'welcome#index'

  resources :counselors
  resources :sessions do
    resources :cabins, except: [:index]
    resources :enf_classes, except: [:index]
    resources :days, except: [:index]
  end

  resources :trips do
    resources :foods, except: [:index]
  end
  resources :campers
  resources :days, except: [:index]
  resources :session_campers, except: [:index, :new]
  resources :session_counselors, except: [:index, :new]

  get 'trip_sessions', to: "trips#enf_session"

end
