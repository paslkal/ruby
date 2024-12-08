Rails.application.routes.draw do
  resources :students, only: [:create, :destroy]
  resources :class_groups, only: [:create]
end
