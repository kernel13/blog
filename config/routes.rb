Blog::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  get "admin" => "admin#index"
  
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  
  resources :users
  #resources :admin
  
  resources :categories do
     resources :posts
  end
  
  resources :posts

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'posts#index'
  
end
