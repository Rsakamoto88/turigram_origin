Rails.application.routes.draw do
  # 一旦削除　５：２５
  # get 'results/index'
  # get 'results/show'
  # get 'results/new'
  # get 'results/edit'
  
  # get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: "home#index"
  resources :users
  # 下記でresultsコントローラーで使うルーディングは自動生成される
  resources :results
end