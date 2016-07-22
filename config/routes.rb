Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  scope module: 'api' do
    namespace :v1 do
      namespace :agents do
        post 'authenticate', to: 'authentication#authenticate'
        resources :requests, except: [:create, :destroy] do
          resources :comments, only: [:index, :create]
        end
      end

      namespace :customers do
        post 'authenticate', to: 'authentication#authenticate'
        resources :requests, except: :destroy do
          resources :comments, only: :create
        end
        resources :customers, only: :create
      end
    end
  end
end
