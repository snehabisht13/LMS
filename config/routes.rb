Rails.application.routes.draw do
  devise_for :banks
  devise_for :customers
  resources :loans
  resources :loans do
  resources :loan_applications, only: [:create]
end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
   root to: "home#index"
  # customers

  get "/all_banks", to: "customers/profiles#index"
  get "/customer_profile", to: "customers/profiles#show" 
  get "/customer_application", to: "customers/profiles#application"

  # for bank to check applications  
  get "/loans_application", to: "loans#applications"



  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
