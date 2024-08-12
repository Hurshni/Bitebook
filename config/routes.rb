Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

Rails.application.routes.draw do
  root 'entries#index'
  
  resources :entries, only: [:create, :new, :destroy]

  # Routes for SymptomLogs using the `entries` controller
  get 'your_symptoms', to: 'entries#your_symptoms'
  post 'your_symptoms', to: 'entries#create_symptom_log'
  delete 'your_symptoms/:id', to: 'entries#destroy_symptom_log', as: 'destroy_symptom_log'
  
  # Other routes
  get 'track_your_health', to: 'entries#track_your_health'
  get 'your_health', to: 'entries#your_health'
  get 'your_health_choices', to: 'entries#your_health_choices'
  get 'food_intake', to: 'entries#food_intake'
  get 'view_your_health_patterns', to: 'entries#view_your_health_patterns'
end




