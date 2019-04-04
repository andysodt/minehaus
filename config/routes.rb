Rails.application.routes.draw do
  resources :contents
  resources :posts
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'welcome/index'
  root 'welcome#index'
end
