Rails.application.routes.draw do
  root to: "groups#index"
  resources :groups, only: [:index, :show] do
    resources :spots, only: [:show]
  end
end
