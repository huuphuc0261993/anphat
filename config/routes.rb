Rails.application.routes.draw do
  root to: 'welcome#index'
  namespace 'api' do
    mount_devise_token_auth_for "Customer", at: 'auth'
    resources :news
    resources :banners
    resources :customers
    resources :products
    resources :categories do
      member do
        get :products
      end
    end
    resources :pictures, only: %w[create destroy]
  end

  devise_for :customers,
             defaults: { format: :json },
             path: '',
             path_names: {
               sign_in: 'api/login',
               sign_out: 'api/logout',
               registration: 'api/signup'
             },
             controllers: {
               sessions: 'sessions',
               registrations: 'registrations'
             }
  match '/*path', to: 'welcome#index', format: false, via: :get
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
