Rails.application.routes.draw do
  resources :students, only: [:create]
  resources :class_groups, only: [:create]
end
