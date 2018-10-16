Rails.application.routes.draw do
  root to: "api/v1/flights#index"
  namespace :api, defaults: { format: :json }, path: '/api' do
    namespace :v1 do
      resources :flights, only: [:index, :destroy_all]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
