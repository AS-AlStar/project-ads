# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  ActiveAdmin.routes(self)
  root to: 'home#index'
end
