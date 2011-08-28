Multitenant::Application.routes.draw do
  namespace :owner do
    resources :clients do
      member do
        post :create_database
        post :migrate_database
        post :drop_database
      end
    end
    resources :databases
  end
end
