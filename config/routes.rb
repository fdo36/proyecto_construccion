ProyectoConstruccion::Application.routes.draw do
  resources :customs


  resources :transit_chamber_ios


  resources :packing_pallets


  resources :turns


  resources :workers


  resources :packing_processes


  resources :subprocesses


  resources :subprocess_ios


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

  resources :products

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
  
  match 'seasons/:id/enable' => 'seasons#enable', :as => 'seasons_enable'
  match 'seasons/:id/disable' => 'seasons#disable', :as => 'seasons_disable'
  match 'seasons/:id/delete_season' => 'seasons#delete_season', :as => 'season_delete'

  match 'destinations/:id/enable' => 'destinations#enable', :as => 'destinations_enable'
  match 'destinations/:id/disable' => 'destinations#disable', :as => 'destinations_disable'
  match 'destinations/:id/delete_destination' => 'destinations#delete_destination', :as => 'destination_delete'

  match 'producers/:id/enable' => 'producers#enable', :as => 'producers_enable'
  match 'producers/:id/disable' => 'producers#disable', :as => 'producers_disable'
  match 'producers/:id/delete_producer' => 'producers#delete_producer', :as => 'producer_delete'
    


  match '/help/css/jquery-ui.css', :to => redirect('/css/jquery-ui.css')
  match '/help/css/styles.css', :to => redirect('/css/styles.css')
  match '/help/css/default_buttons.css', :to => redirect('/css/default_buttons.css')

  match 'receipts/generate_pdf' => 'receipts#generate_pdf', :as => 'receipts_generate_pdf'
  
end
