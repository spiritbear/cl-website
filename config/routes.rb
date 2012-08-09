ClWebsite::Application.routes.draw do
  get "companies/index"

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
  resources :users
  resources :members do
    match 'hand-written-reviews' => "members#hand_written_reviews", :as => "hand_written_reviews"
  end
  
  resources :companies do
    resources :reviews do
    end
  end

  resources :companies
  resources :reviews do
    match 'rate' => "reviews#rate", :as => :rate
    resources :questions
  end

  match 'reviews/ask-reviewer/:review_id' => "questions#new", :as => :reviews_ask_reviewer    
  match 'reviews/:company_id/:company_slug' => "reviews#index", :as => :reviews_index
  match 'reviews/:company_id/:company_slug' => "reviews#index", :as => :reviews_index
  
  match 'facebook/authorize_posting' => 'facebook#authorize_posting', :as => :facebook_authorize_posting
  
  
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
