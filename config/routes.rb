Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index', vai: [:get]
  get 'upload', :to => 'upload#new'
  post 'upload', :to => 'upload#create'
  #root 'upload#new', via: [:get]
  #root 'upload#create', via: [:post]
  get 'album/:id/images', :to => 'images#index'
  resources :album

end
