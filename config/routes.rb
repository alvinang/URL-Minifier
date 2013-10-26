Minurl::Application.routes.draw do
  devise_for :users, path_names: {sign_in: 'login', sign_out: 'logout'},
             controllers: {omniauth_callbacks: 'omniauth_callbacks'}
  resources :urls

  match ':short_url', controller: "urls", action: "redirect", via: [:get]

  authenticated do
    root to: 'dashboard#index', as: :authenticated_root
  end

  root to: 'urls#new'
end
