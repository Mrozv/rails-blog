Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  root "home#index"

  resources :blog_posts do
    resources :comments, only: [ :create, :destroy ]
  end

  get "search_user", to: "home#index"

  resources :users, only: [ :show ]

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
