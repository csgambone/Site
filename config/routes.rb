Rails.application.routes.draw do
  resources :catch_rates

  #get 'welcome/index'

  resources :articles do
    resources :comments
  end

  resources :questions

  resources :games

  get '/multiplechoice' => 'pages#multiplechoice'
  
  root 'welcome#index'
end
