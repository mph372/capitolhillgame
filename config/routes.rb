Rails.application.routes.draw do
  resources :districts do
    member do
    get 'join'
    end
  end
  resources :states
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
