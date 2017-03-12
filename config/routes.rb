Rails.application.routes.draw do
  resources :records, only: :index do
    collection do
      get 'new_a', to: 'records#new_a'
      get 'new_txt', to: 'records#new_txt'
    end
  end
end
