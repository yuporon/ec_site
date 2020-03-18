Rails.application.routes.draw do
  devise_for :publics
  devise_for :admins
  namespace :admins do
    resources :items
  end
end
