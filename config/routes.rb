ActionController::Routing::Routes.draw do |map|
  
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  
  map.resources :users

  map.resource :session
  map.resources :products, :has_many => [ :images, :assets, :placements, :specifications, :customizations, :qualities, :variants ]
  map.resources :variants, :has_many => [ :images, :assets, :specifications, :customizations, :qualities ]
  map.resources :categories, :has_many => [ :images, :placements, :options ]
  map.resources :images
  map.resources :assets
  
  map.resources :options, :has_many => [ :customizations ]

  map.resources :placements 
  
  map.resources :contacts
  
  map.static '/info/:permalink', :controller => 'pages', :action => 'show'
  map.with_options :controller => 'pages' do |pages|
    pages.error 'access-error', :action => 'error'
    pages.denied 'access-denied', :action => 'denied'
  end
  map.resources :pages
  
  map.root :controller => 'pages', :action => 'show', :permalink => 'homepage'
  
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
