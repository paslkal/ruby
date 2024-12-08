Rails.application.routes.draw do
  resources :schools, only: [] do
    resources :classes, only: [] do
      resources :students, only: [:index]
    end
  end
  resources :students, only: [:create, :destroy]
  resources :class_groups, only: [:create]
end
