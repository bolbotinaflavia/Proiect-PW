Rails.application.routes.draw do
  resources :rezervares
  resources :tours
  resources :users do
    member do
      post :make_admin
      delete :destroy
    end
  end
 
  resources :admin
  #resources :eveniments

  root 'muzeu#index'
  resources :eveniments do
    member do
      get 'tours_for_event'
    end
  end

  get "muzeu", to: "muzeu#index"
  get 'rezervari', to: "rezervari#index"
  resources :admin
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'make_admin', to: 'users#make_admin'
  post 'make admin', to: 'users#make_admin'
  
  #resources :rezervares, only: [:create, :show, :edit, :update, :destroy]
#get '/rezervares/new/:event_id/:tour_id', to: 'rezervares#new', as: 'new_rezervare'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  #get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
