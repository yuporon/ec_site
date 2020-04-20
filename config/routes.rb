Rails.application.routes.draw do
  devise_for :end_users, 
    path: 'public/end_users', 
    controllers: {
        sessions: 'devise/end_users/sessions',
        passwords: 'devise/end_users/passwords',
        registrations: 'devise/end_users/registrations',
    }

  devise_for :admins, 
    path: "admin",
    controllers: {
        sessions: 'devise/admins/sessions',
    }
  
  namespace :admin do

    resources :items
    resources :end_users, :only => [:index, :show, :edit, :update]

  end
  namespace :public do

    resource :end_user, :only => [:show, :edit, :update]
    get "end_user/withdrow"      => "end_users#withdrow"
    patch "end_user/switch"      => "end_users#switch"
  
    resources :items, :only => [:index, :show]
    resources :cart_items, :only => [:index, :update, :destroy, :destroy_all, :create]
  end
end
