Multitenant::Application.routes.draw do
  namespace :owner do
    resources :clients
    resources :databases
  end
end
