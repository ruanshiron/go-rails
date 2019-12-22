Rails.application.routes.draw do
  get 'notifications/index'
  resources :routers
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  get 'users/new'

  scope "(:locale)", locale: /en|vi/ do
    root 'static_pages#home'

    get  '/help',    to: 'static_pages#help'
    get  '/about',   to: 'static_pages#about'
    get  '/contact', to: 'static_pages#contact'
    get  '/signup',  to: 'users#new'
    post '/signup',  to: 'users#create'
    get    '/login',   to: 'sessions#new'
    post   '/login',   to: 'sessions#create'
    delete '/logout',  to: 'sessions#destroy'
    get '/auth/:provider/callback', to: 'sessions#create'

    resources :users do
      member do
        get :following, :followers
      end
    end
  end

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]

  mount ActionCable.server => '/cable'
end