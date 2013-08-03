Gotv::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :fans
  root :to => "home#index"
  match 'subscribe' => 'home#create', :as => :subscribe
  ActiveAdmin.routes(self)
end
