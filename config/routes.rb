Rails.application.routes.draw do
  resources :reviews
  resources :reviewers
  namespace :api do
    namespace :v1 do
      resources :administrators do
        member do 
          get :confirm_email, to: 'authentication#confirm'
        end
      end  
  post '/auth/login', to: 'authentication#login'
  put 'password/update', to: 'passwords#update'
  post 'password/forgot/', to: 'passwords#forgot', constraints: { email: /.*/ }
  post 'password/reset/', to: 'passwords#reset'
  resources :units
  resources :hospitals
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
