Rails.application.routes.draw do
  devise_for :users
  # root to: 'pages#landing'
  root to: "pages#home"
  get 'infos', to: 'pages#infos', as: :"infos-pratiques"
  resources :answers, only: [:new, :create]
  get 'answer', to: "answers#new"
  post 'answer', to: 'pages#answer'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
