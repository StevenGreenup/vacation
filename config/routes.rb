Rails.application.routes.draw do
  use_doorkeeper

  root 'users#show'

  get 'registration' => 'users#new', as: :new_user
  post 'registration' => 'users#create', as: :create_user
  get 'users/:id' => 'users#show', as: :user

  get 'sign_in' => 'sessions#new', as: :sign_in
  post 'sign_in' => 'sessions#create'
  delete 'sign_in' => 'sessions#delete'

  get 'vacations/new' => 'vacations#new', as: :new_vacation
  get 'vacations/:id' => 'vacations#show', as: :vacation
  post 'vacations' => 'vacations#create', as: :create_vacation
  delete 'vacations/:id' => 'vacations#delete', as: :delete_vacation

  delete 'photos/:vacation_id' => 'photos#delete', as: :delete_photo
  get 'photos/vacation/:vacation_id/new' => 'photos#new', as: :new_vacation_photos
  get 'photos/vacation/:vacation_id' => 'photos#show', as: :vacation_photos
  get 'photos/:id/edit' => 'photos#edit', as: :edit_vacation_photos
  patch 'photos/:id' => 'photos#update', as: :update_vacation_photos
  post 'photos/vacation/:vacation_id/new' => 'photos#create', as: :create_vacation_photos


  get 'api/vacations' => 'api/vacations#index', as: :api_vacations
  get 'api/vacations/:id' => 'api/vacations#show', as: :api_vacation

  get 'api/users/:id' => 'api/users#show', as: :api_user_vacation
  get 'api/me/photos' => 'api/me#me', as: :api_me

  post '/api/users' => 'api/users#create'




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
