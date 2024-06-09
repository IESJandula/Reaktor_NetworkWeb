Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  devise_for :users

  root to: "main#inicio"

  get "inicio", to: "main#inicio"

  get 'export_csv', to: 'main#export_csv', as: 'export_csv'

  get "borrar", to: "main#borrar"

  post '/borrar', to: 'main#borrar'

  # Defines the root path route ("/")
  # root "posts#index"
end
