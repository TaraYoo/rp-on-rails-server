# frozen_string_literal: true

Rails.application.routes.draw do
  # RESTful routes
  resources :bokbulboks, except: %i[new edit]

  get '/random' => 'bokbulboks#random'

  resources :locations, except: %i[new edit]

  # Custom routes
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out' => 'users#signout'
  patch '/change-password' => 'users#changepw'
  delete '/demo-sign-out' => 'users#demosignout'
  post '/demo-sign-in' => 'users#demosignin'
end
