Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  # get '/about' => 'pages#about'
  resources :articles
end
