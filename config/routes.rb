Rails.application.routes.draw do
  resources :schools, only: [:index] do
    resources :assignments
  end

  get 'schools/search' => 'schools#search'
  resources :assignments, only: [:show]

  root 'home#index'
end
