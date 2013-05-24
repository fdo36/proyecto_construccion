ProyectoConstruccion::Application.routes.draw do
  resources :seasons


  resources :containers


  resources :destinations


  resources :varieties


  resources :kinds


  resources :qualities


  resources :groupings


  resources :producers

  resources :regions do
     resources :communes
  end

  resources :roles do
    resources :access_rights
  end

  match "/admin/users/:id/edit_password" => "users#edit_password", :as => "edit_user_password"

  resources :companies

  devise_for :users
  resources :users, :path => "admin/users"



  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'start#index'
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
  
  match 'users/:id/enable' => 'users#enable', :as => 'users_enable'
  match 'users/:id/disable' => 'users#disable', :as => 'users_disable'
  
  match 'seasons/:id/enable' => 'seasons#enable', :as => 'seasons_enable'
  match 'seasons/:id/disable' => 'seasons#disable', :as => 'seasons_disable'
  match 'seasons/:id/delete_season' => 'seasons#delete_season', :as => 'season_delete'

  match 'destinations/:id/enable' => 'destinations#enable', :as => 'destinations_enable'
  match 'destinations/:id/disable' => 'destinations#disable', :as => 'destinations_disable'
  match 'destinations/:id/delete_destination' => 'destinations#delete_destination', :as => 'destination_delete'

  match 'producers/:id/enable' => 'producers#enable', :as => 'producers_enable'
  match 'producers/:id/disable' => 'producers#disable', :as => 'producers_disable'
  match 'producers/:id/delete_producer' => 'producers#delete_producer', :as => 'producer_delete'
  
end
