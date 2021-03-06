Rails.application.routes.draw do

  
  
  get 'homepage/new'

  get 'homepage/create'

  resources :users do
    resources :pants
    resources :lists
    resources :gyros
    resources :sandwiches
    resources :pizzas
  end

  

  get 'welcome/index'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'sessions/login'
  get 'homepage' => "users#homepage", :as => "homepage"
  match 'users/homepage' => 'users#homepage', via: [:get, :post], :as => :userhome



  get "signup" => "users#new", :as => "signup"  #this means that  /signup redirects to users controller calling the new method, as is the name of the route
  # get "newpants" => "pants#create", :as => "newpants"
#so this means that we have signup_url and signup_path


  get  'login' => 'sessions#new'
  post 'login' => "sessions#create"
  get  "logout" => "sessions#destroy", :as => "logout"

  #root of the site
  root 'welcome#index'

  
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
