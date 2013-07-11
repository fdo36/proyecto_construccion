ProyectoConstruccion::Application.routes.draw do
  #get "packing_reports/index"
  resources :packing_reports

  resources :dispatch_ios


  resources :charging_orders


  resources :custom_agents

  resources :supplies_providers_loans

  resources :supplies_returns

  resources :supplies_loans

  resources :store_finish_products

  resources :destination_ports

  resources :origin_ports

  resources :frozen_tunnel_ios

  resources :wash_chamber_ios

  resources :tunnels

  resources :tunnels

  resources :customs

  resources :pallet_finished_products

  resources :packing_pallets

  resources :final_packing_pallets
  resources :production_process_ios

  resources :customs
  resources :receipt_packing_ios

  resources :transit_chamber_ios


  resources :turns
  resources :stabilization_chamber_ios

  resources :workers


  resources :packing_processes
  resources :format_packings

  resources :subprocesses
  resources :providers
  resources :workers

  resources :subprocess_ios
  resources :supplies


  resources :pack_packings

  resources :empty_packs_destination_moves


  resources :empty_packs_producer_moves

  resources :empty_packs

  wiki_root '/wiki'
  
  resources :reports

  resources :localities

  resources :settings
  
  resources :pack_group_dispatches

  resources :pack_group_receipts

  resources :receipts

  resources :pack_types

  resources :receipts do
    resources :pallets    
  end

  resources :dispatches do
    resources :pack_group_dispatches
  end

  resources :receipts do
    resources :pack_group_receipts
  end

  resources :pallets

  resources :dispatches

  resources :seasons

  resources :destinations do
    resources :empty_packs_destination_moves
  end  

  resources :dispatches do
    resources :pallets    
  end

  resources :dispatches do
    resources :pack_group_dispatches
  end

  resources :varieties
  
  resources :kinds
  
  
  resources :qualities

  resources :groupings

  resources :producers do 
    resources :empty_packs_producer_moves
  end  
  resources :regions do
     resources :communes
  end

  match "/companies/:company_id/users/:id/edit_password" => "users#edit_password", :as => "edit_user_password"
  match "/companies/:company_id/users/:id/show_user" => "users#show_user", :as => "show_user_profile"
  match "/companies/:company_id/users/:id/edit_user" => "users#edit_user", :as => "edit_user_profile"

  resources :companies do
    resources :roles do
      resources :access_rights
    end
    resources :users
  end

  devise_for :users

  root :to => 'start#index'
  # See how all your routes lay out with "rake routes"

  match 'companies/:company_id/users/:id/enable' => 'users#enable', :as => 'users_enable'
  match 'companies/:company_id/users/:id/disable' => 'users#disable', :as => 'users_disable'

  match 'companies/:id/enable' => 'companies#enable', :as => 'companies_enable'
  match 'companies/:id/disable' => 'companies#disable', :as => 'companies_disable'

  match 'providers/:id/enable' => 'providers#enable', :as => 'providers_enable'
  match 'providers/:id/disable' => 'providers#disable', :as => 'providers_disable'

  match 'seasons/:id/enable' => 'seasons#enable', :as => 'seasons_enable'
  match 'seasons/:id/disable' => 'seasons#disable', :as => 'seasons_disable'
  match 'seasons/:id/delete_season' => 'seasons#delete_season', :as => 'season_delete'

  match 'destinations/:id/enable' => 'destinations#enable', :as => 'destinations_enable'
  match 'destinations/:id/disable' => 'destinations#disable', :as => 'destinations_disable'
  match 'destinations/:id/delete_destination' => 'destinations#delete_destination', :as => 'destination_delete'

  match 'producers/:id/enable' => 'producers#enable', :as => 'producers_enable'
  match 'producers/:id/disable' => 'producers#disable', :as => 'producers_disable'
  match 'producers/:id/delete_producer' => 'producers#delete_producer', :as => 'producer_delete'

  match 'receipts/generate_pdf' => 'receipts#generate_pdf', :as => 'receipts_generate_pdf'

  match 'tunnels/:id/delete_tunnel' => 'tunnels#delete_tunnel', :as => 'tunnel_delete'

  match 'transit_chamber_io_valid_pallets' => 'transit_chamber_ios#valid_pallets'
  match 'transit_chamber_io_pallets_already_added' => 'transit_chamber_ios#pallets_already_added'
  


  match 'stabilization_chamber_io_valid_pallets' => 'stabilization_chamber_ios#valid_pallets'
  match 'stabilization_chamber_io_pallets_already_added' => 'stabilization_chamber_ios#pallets_already_added'


  match 'frozen_tunnel_io_valid_pallets' => 'frozen_tunnel_ios#valid_pallets'
  match 'frozen_tunnel_io_pallets_already_added' => 'frozen_tunnel_ios#pallets_already_added'
end
