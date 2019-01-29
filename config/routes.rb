Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'

  resources :payments
  resources :applications
  resources :lodgings
  resources :workshops

  resources :application_settings

  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/privacy', to: 'static_pages#privacy'
  get '/terms_of_service', to: 'static_pages#terms_of_use'
  get '/conference_closed', to: 'static_pages#conference_closed'
  get '/conference_full', to: 'static_pages#conference_full'

  get 'payment_receipt', to: 'payments#payment_receipt'
  get 'make_payment', to: 'payments#make_payment'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
