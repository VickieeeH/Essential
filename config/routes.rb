Rails.application.routes.draw do

  resources :categories
  get 'users/new'
  root to: "static_pages#home"

  get  '/about',   to: 'static_pages#about'
  get  '/contact',   to: 'static_pages#contact'

  devise_for :users
  resources :records
  resources :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
