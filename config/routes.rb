Rails.application.routes.draw do

  root 'buildings#index'

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :invitations => 'users/invitations'
  } 

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end



  resources :buildings

  resources :users, :only => [:index, :show]


  resources :buildings , only: [:create ,:new ] do
    resources :parts, only: [:new,:create,:edit,:update, :show,:destroy]
  end

  resources :buildings , only: [:create ,:new ] do
    resources :tops , only: [:index, :show] do
      resources :mainparts, only: [:index, :show] do
        resources :parts, only: [:new,:create,:edit,:update] 
      end
    end
  end



  resources :buildings ,only: [:show] do
    resources :reforms ,only: [:new, :create,:destroy, :edit, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
