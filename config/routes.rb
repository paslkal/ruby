Rails.application.routes.draw do
  resources :schools, only: [] do
    resources :classes, only: [], controller: 'class_groups' do
      resources :students, only: [:index]
    end

    resources :classes, only: [:index], controller: 'class_groups'
  end

  resources :students, only: [:create, :destroy]

  resources :classes, only: [:create], controller: 'class_groups'
end
