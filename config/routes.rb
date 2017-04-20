Rails.application.routes.draw do
  get 'questions/index'
  root 'questions#index'
  resources :questions do
    resources :answers, only: [:new, :create, :show, :update]
  end


  get "/auth/:provider/callback", to: "sessions#create"
  get 'auth/failure', to: redirect('/')
  delete 'signout', to: 'sessions#destroy', as: 'signout'
  root to: 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
