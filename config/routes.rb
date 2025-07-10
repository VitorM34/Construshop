require "sidekiq/web"

Rails.application.routes.draw do
  devise_for :users
  resources :produtos

  get "up" => "rails/health#show", as: :rails_health_check

  root to: "produtos#index"

  get "home", to: "home#index"
  get "quem_somos", to: "pages#quem_somos"
  get "/quem-somos", to: redirect("/quem_somos")
  get "atendimento", to: "pages#atendimento"

  mount Sidekiq::Web => "/sidekiq"
end
