Rails.application.routes.draw do
  resources :politicians
  resources :congresses do
    resources :memberships
    get 'join', :on => :member
    
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: "congresses#index"
end
