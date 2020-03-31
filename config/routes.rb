Rails.application.routes.draw do
  devise_for :end_users, 
    path: 'publics/end_users', 
    controllers: {
        sessions: 'devise/end_users/sessions',
        passwords: 'devise/end_users/passwords',
        registrations: 'devise/end_users/registrations',
    }

  devise_for :admins, 
    controllers: {
        sessions: 'devise/admins/sessions',
    }
  
  namespace :admins do

    resources :items

  end
  namespace :publics do

    resource :end_users, :only => [:show, :edit, :update]
    get "end_users/withdrow"      => "publics/end_users#withdrow"
    patch "end_users/switch"      => "publics/end_users#switch"

  end
end
