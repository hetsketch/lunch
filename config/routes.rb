Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}

  root to: 'menus#index'

  resources :menus
  resources :menu_items
  resources :users
  resources :orders

  get '/stats', to: 'orders#stats'
  # Don't sure about this. But it works.
end
