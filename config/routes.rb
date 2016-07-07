Rails.application.routes.draw do
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
      get :fb_test
    end
  end
  root "projects#index"
end
