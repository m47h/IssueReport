Rails.application.routes.draw do

  devise_for :users
  devise_scope :user do
    get 'sign_out', to: 'devise/sessions#destroy'
  end
  resources :projects do
    resources :issues, only: [:index, :create, :new, :update] do
      get :search, on: :collection
    end
  end
  resources :issues, except: [:create, :new] do
    get :search, on: :collection
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "projects#index"
end
