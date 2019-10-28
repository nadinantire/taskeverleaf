Rails.application.routes.draw do
  root 'sessions#new'
<<<<<<< HEAD
  root 'usr#index'
=======
  root to: "usr#index"
>>>>>>> de01cb4f7990c53b11b66ce2345abcd92336ceb8
  resources :sessions
  resources :usrs
  resources :tasks
  # root 'tasks#index'

  # root 'tasks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :usrs
  end
end
