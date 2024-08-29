Rails.application.routes.draw do

  devise_for :users
  resources :quizzes do
    resources :questions do
      resources :answers
    end
  end
  root "home#index"
end