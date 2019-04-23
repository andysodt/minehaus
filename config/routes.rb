# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'home/index'
  root 'home#index'

  scope :api do
    scope :v1 do
      resources :resources, only: %i[index create destroy update]
    end
  end

end
