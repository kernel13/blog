Blog::Application.routes.draw do
<<<<<<< HEAD
  mount Ckeditor::Engine => '/ckeditor'

  get "admin/index"

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  
  resources :users
  resources :admin
  
  resources :categories do
    resources :posts
  end
  
  resources :posts
=======
  get "say/hello"

  get "say/goodbye"
>>>>>>> af435c4bc5467c40a503b053920c1a7a3dddb6f4

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
<<<<<<< HEAD
  root :to => 'posts#index'
=======
  # root :to => 'welcome#index'
>>>>>>> af435c4bc5467c40a503b053920c1a7a3dddb6f4

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
<<<<<<< HEAD
  # match ':controller(/:action(/:id))(.:format)'
  
=======
  # match ':controller(/:action(/:id(.:format)))'
>>>>>>> af435c4bc5467c40a503b053920c1a7a3dddb6f4
end
