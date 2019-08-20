Rails.application.routes.draw do
  resources :user1s
  resources :places
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

#devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }  
  # resources :users do 
  #   resources :orders 
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'homes#index'
resources 'homes'

resources :carts do
  collection do
    get 'chackout'
  end
end 
     
resources :products do 
  resources :likes
end

end
