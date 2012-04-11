Blog::Application.routes.draw do
  
  root :to => 'posts#index'
  
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
  
end
