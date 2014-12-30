Rails.application.routes.draw do
  resources :catch_rates

  resources :articles do
    resources :comments
  end

  resources :questions

  resources :games

  get '/multiplechoice' => 'pages#multiplechoice'
  get '/quiz_lite' => 'pages#quiz_lite'
  get '/questions/test_partial' => 'questions#test'

  root 'welcome#index2'
end
