Rails.application.routes.draw do
  devise_for :users
  root to: "groups#index"
  resources :groups, only: [:index, :show] do
    resources :spots do
      # スポットの訪問状態をトグルするルートを追加
      patch :toggle_visited, on: :member
    end
  end
  resources :users, only: [:edit, :update]
end
