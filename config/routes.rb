Rails.application.routes.draw do


  get 'dashboard/super_admin'

  get 'dashboard/manager_admin'

  root 'home#index'

  resources :inavailabilities
  resources :time_slots
  resources :ratings
  resources :deals
  resources :food_item_add_ons
  resources :food_items
  resources :catering_companies
  #Todo: add it under namespace
  resources :addresses
  devise_for :users

  get 'home/create_new_user' => 'home#create_new_user'
  get 'home/edit_user/:id' => 'home#edit_user'
  post 'home/save_new_user' => 'home#save_new_user'


  get '/admin/dashboard' => 'dashboard#super_admin'
  get '/admin/dashboard/manage_users' => 'dashboard#super_admin_manage_user'
  get '/admin/dashboard/manage_company' => 'dashboard#super_admin_manage_company'
  get '/admin/dashboard/manage_orders' => 'dashboard#super_admin_manage_orders'

  delete '/admin/dashboard/manage_users/delete/:id' => 'dashboard#destroy_user'
  delete '/admin/dashboard/manage_company/delete/:id' => 'dashboard#destroy_comp'
  delete '/admin/dashboard/manage_company/delete/:id' => 'dashboard#destroy_order'



  devise_scope :user do
    authenticated :user do
      root :to => 'home#index', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'home#index', as: :unauthenticated_root
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
