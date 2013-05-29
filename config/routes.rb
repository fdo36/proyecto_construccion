ProyectoConstruccion::Application.routes.draw do


  resources :reports

  resources :localities

  resources :settings

  resources :pack_group_dispatches

  resources :receipts

  resources :pack_types

  resources :receipts do
    resources :pallets    
  end

  resources :receipts do
    resources :pack_group_receipts
  end
 
  resources :pallets

  resources :dispatches

  resources :seasons

  resources :destinations

  resources :varieties

  resources :kinds

  resources :qualities

  resources :groupings

  resources :producers


  match "/admin/users/:id/edit_password" => "users#edit_password", :as => "edit_user_password"

  resources :companies do
    resources :roles do
      resources :access_rights
    end
    resources :users
  end

  devise_for :users, :path => "admin/users"

  root :to => 'start#index'

  # See how all your routes lay out with "rake routes"

  match 'companies/:company_id/users/:id/enable' => 'users#enable', :as => 'users_enable'
  match 'companies/:company_id/users/:id/disable' => 'users#disable', :as => 'users_disable'

  match 'companies/:id/enable' => 'companies#enable', :as => 'companies_enable'
  match 'companies/:id/disable' => 'companies#disable', :as => 'companies_disable'
  
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
