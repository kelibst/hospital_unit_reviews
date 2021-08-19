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
  post '/addslot', to: 'administrators#slot'
  get '/admin/units/reviewing/:id', to: 'administrators#reviewing'
  get '/admin/getslots/:id', to: 'administrators#user_slot'
  get '/units-reviews/:id', to: 'units#unitrevs'
  get 'units/reviewing/:id', to: 'units#reviewing'
  post '/auth/reviewer/login', to: 'authentication#reviewer_login'
  put 'password/update', to: 'passwords#update'
  post 'password/forgot/', to: 'passwords#forgot', constraints: { email: /.*/ }
  post 'password/reset/', to: 'passwords#reset'
  resources :units
  resources :hospitals
    end
  end
 get '/getslots/:id', to: 'reviewers#user_slot'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
