Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'v1/sessions#create'
  namespace :v1 do
    get 'signout', to: 'sessions#destroy', as: 'signout'
    resources :sessions, only: [:create, :destroy]

    resources :courses
    resources :categories
    resources :verticals
  end
end
