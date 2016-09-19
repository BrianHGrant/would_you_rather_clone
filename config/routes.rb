Rails.application.routes.draw do
  root :to => 'question#index'
  resources :questions
end
