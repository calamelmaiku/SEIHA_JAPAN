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

  # admin という名前空間を作成。この中に定義されたルートは、全てURLの先頭に /admin が追加される。
  namespace :admin do
    resources :groups
    resources :spots
  end
end
