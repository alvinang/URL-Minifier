Minurl::Application.routes.draw do
  devise_for :users, path_names: {sign_in: 'login', sign_out: 'logout'}
  resources :urls

  match ':short_url', controller: "urls", action: "redirect", via: [:get]
  root to: 'urls#new'
end
