Rails.application.routes.draw do
  namespace :v1 do
    resources :courses
    resources :categories
    resources :verticals
  end
end
