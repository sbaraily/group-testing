Rails.application.routes.draw do
  root 'schools#index'

  resources :schools do
  end
  resources :students
  
end
