Rails.application.routes.draw do
  root "home#index"
  resource :search, only: :show
  resource :pdf, only: :show do
    member do
      get :zip
    end
  end
end
