Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root "homes#index"
  root "zipcode#index"

  resources :zipcode, only: [:index, :show, :new, :create] do
    resources :snow_log, only: [:index, :new, :create]
  end

end
