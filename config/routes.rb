Rails.application.routes.draw do
  get 'spots/show'
  root to: "groups#index"
  resources :groups, only: [:index, :show]
  resources :spots, only: :show
end
