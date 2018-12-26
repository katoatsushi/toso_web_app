Rails.application.routes.draw do

  get 'users/show'

  get 'users/index'

  devise_for :users

  resources :buildings
  #resources :users do
  resources :users, :only => [:index, :show]

  resources :buildings , only: [:create ,:new ] do
    resources :parts, only: [:new,:create,:edit,:update, :show,:destroy]
  end
   
  root 'buildings#index'

  resources :buildings , only: [:create ,:new ] do
    resources :mainparts, only: [:index, :show] do
      resources :materials, only: [:index, :show] do
        resources :symptoms, only: [:index, :show] do
          resources :details do
            resources :parts, only: [:new,:create,:edit,:update] 
          end
        end
      end
    end
  end


  resources :buildings , only: [:create ,:new ] do
    resources :mainparts, only: [:index, :show] do
      resources :materials, only: [:index, :show] do
            resources :parts, only: [:new,:create,:edit,:update] 
          end
    end
  end



  resources :buildings ,only: [:show] do
    resources :reforms ,only: [:new, :create,:destroy, :edit, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
