Rails.application.routes.draw do
  resources :cuisines
  resources :restaurants do
    resources :reviews
  end

  root 'we_eat#index', as: 'we_eat_index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
