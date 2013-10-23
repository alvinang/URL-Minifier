Minurl::Application.routes.draw do
  resources :urls

  match ':short_url', controller: "urls", action: "redirect", via: [:get]
  root to: 'urls#new'
end
