Rails.application.routes.draw do
  resources :reviewers
  namespace :api do
    namespace :v1 do
      resources :administrators do
        member do 
          get :confirm_email, to: 'authentication#confirm'
        end
      end  
  post '/auth/login', to: 'authentication#login'
  resources :units
  resources :hospitals
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
