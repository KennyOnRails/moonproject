Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :projects
  end

  resources :projects do
    resources :real_lives
    resources :comments
    resources :progresses do
      member do
        post :confirm
      end
    end
    member do
      get :wizard
    end
  end

  root "projects#index"
end
