Rails.application.routes.draw do
  devise_for :users, :controllers => {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :records do
    member do
      get 'aggregate_result'
    end
  end
  resources :records
  root to: 'records#index'

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

end