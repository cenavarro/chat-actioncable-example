# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :chats do
    resources :messages, only: [:create]
  end

  mount ActionCable.server => '/cable'
  root "chats#index"
end
