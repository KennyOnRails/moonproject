Rails.application.routes.draw do
  resources :projects do
    resources :real_lives
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
