Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources 'conditions', only: :create, defaults: { format: :json }
  get '/conditions/:id/calculate', to: 'conditions#calculate'
end
