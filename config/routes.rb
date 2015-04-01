Auth::Application.routes.draw do
  root to: "sessions#new"
  get 'sessions/customer'
  get 'sessions/index'
  get 'sessions/show'
  get 'sessions/enter'
  get 'vendors/home'
  get 'vendors/edit'
  get 'providers/home'
  get 'codes/index'
  get 'codes/views'

  get 'vendors/new'
  match "/auth/:provider/callback", to: "sessions#create"
  match "/auth/failure", to: "sessions#failure"
  match "/logout", to: "sessions#destroy", :as => "logout"
  match "/logout", to: "vendors#destroy", :as => "logout2"
  match "/logout", to: "providers#destroy", :as => "logout3"
  resources :sessions
  resources :vendors
  resources :providers
  resources :codes do
    collection { post :import }
  end
end
