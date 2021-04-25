Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :administrators do
        # member do 
        #   get :confirm_email, to: 'authentication#confirm'
        # end
      end
    end
  end
  resources :units
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
