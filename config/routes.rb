Rails.application.routes.draw do
  resources :records, except: [:new, :edit] do
    collection do
      get 'new_a', to: 'records#new_a'
      get 'new_mx', to: 'records#new_mx'
    end

    get 'edit_a', to: 'records#edit_a'
    get 'edit_mx', to: 'records#edit_mx'
  end
end
