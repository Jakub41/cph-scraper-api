Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :flights, only: [:index, :destroy_all]
      get 'flights/:type', to: 'flights#filter'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
