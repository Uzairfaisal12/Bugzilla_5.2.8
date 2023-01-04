# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'dashboard#home'

  resources :projects do
    resources :buggs do
      member do
        get :start_working
        get :in_progress
        get :completed
      end
    end
  end

  get 'dashboard/developer', to: 'dashboard#developer'
  get 'dashboard/manager', to: 'dashboard#manager'
  get 'dashboard/qa', to: 'dashboard#qa'
end
