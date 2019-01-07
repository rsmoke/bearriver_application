Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/privacy', to: 'static_pages#privacy'
  get '/terms_of_service', to: 'static_pages#terms_of_use'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
