Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'users/new'
  get 'users/create'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  root 'welcome#index'

  get '/about', to: 'users#about'
  get '/payment_info', to: 'users#payment_info'
  post '/make_payment', to: 'transactions#make_payment'
  get '/transactions', to: 'users#transactions'
end