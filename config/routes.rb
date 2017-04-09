Rails.application.routes.draw do
  resources :records, except: [:new, :edit] do
    collection do
      get 'new_a', to: 'records#new_a'
      get 'new_mx', to: 'records#new_mx'

      resources :record_as, except: :index, path: 'a'
      resources :record_mxes, except: :index, path: 'mx'
    end
  end
end
