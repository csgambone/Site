Rails.application.routes.draw do
  #get 'welcome/index'

  resources :articles do
    resources :comments
  end

  resources :questions

  get '/multiplechoice' => 'pages#multiplechoice'
  
  root 'welcome#index'
end
