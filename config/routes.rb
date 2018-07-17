Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: 'dogs#index'
  resources :dogs

  match '/random' => 'dogs#random', as: :random_dog, via: [:get]
end
