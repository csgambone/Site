Rails.application.routes.draw do
  #get 'welcome/index'

  resources :articles do
    resources :comments
  end

  resources :questions
  
  root 'welcome#index'
end
