Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :clients, only: [:create, :index, :show] do
        resources :invoices, only: [:create]
        member do
          get :invoices
        end  
      end
    end
  end  
end
