Rails.application.routes.draw do
  devise_for :users
  resources :records do
    member do
      get 'aggregate_result'
    end
  end
  resources :records
  # get 'aggregate_result', to: 'aggregate_result#index'
  root to: 'records#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end