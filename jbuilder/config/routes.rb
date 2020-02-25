Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :gifts, only: [:show]
    resources :guests, only: [:index, :show] do 
      resources :gift, only: [:index]
    end
   resources :parties, only: [:index, :show]
  end
end


