Rails.application.routes.draw do
  devise_for :users
  root to: "groups#index"
  resources :groups, only: [:index, :show] do
    resources :spots, only: [:show]
  end
end
