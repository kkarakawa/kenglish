Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "test#index"
  resources :sentence, only: [:index, :show]
  resources :test, only: [:index, :show]
  post "test/answer", to: "test#answer"
end
