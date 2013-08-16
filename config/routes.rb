Gotv::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config

  root :to => "home#index"
  match 'subscribe' => 'home#create', :as => :subscribe
  match 'game' => 'home#game', :as => :game
  
  resources :fan
  ActiveAdmin.routes(self)
end
