Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#landing'
  get 'home', to: "pages#home", as: :"mariage"
  get 'infos', to: 'pages#infos', as: :"infos-pratiques"
  resources :answers, only: [:new, :create]
  post 'answer', to: 'pages#answer'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
