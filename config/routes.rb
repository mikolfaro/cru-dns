Rails.application.routes.draw do
  resources :records, only: :index
end
