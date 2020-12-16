Rails.application.routes.draw do
  root to: 'welcome#index'
  namespace 'api' do
    resources :news
    resources :banners
    resources :customers
    resources :products
    resources :categories
    resources :pictures, only: %w[create destroy]
  end
  match '/*path', to: 'welcome#index', format: false, via: :get
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
