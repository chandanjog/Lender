Lender::Application.routes.draw do

  match "admin/attachments" => "custom/attachments#index", :as => :attachments
  match "admin/attachment" => "custom/attachments#create", :via => :post, :as => :create_attachment
  match "admin/attachment/:id" => "custom/attachments#destroy", :via => :delete, :as => :delete_attachment
  match "admin/attachment/:id" => "custom/attachments#show", :via => :get, :as => :show_attachment

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

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

  match "/loans" => "custom/loans#create", :via => :post
  match "/loans/:id" => "custom/loans#update", :via => :put , :as => "update_loan"

  match "/payments" => "custom/payments#create", :via => :post
  match "/admin/loans/:loan_id/payments" => "admin/payments#index", :via=> :get , :as => "admin_loan_payments"
#  match "/admin/loans/:loan_id/payments" => "custom/payments#index", :via=> :get , :as => "admin_loan_payments"
#  match "/admin/loans/:loan_id/payments" => "admin/loans#payments", :via=> :get , :as => "admin_loan_payments"

  match "/admin/loans/:loan_id/payments/new" => "admin/payments#new", :via=>:get, :as => "admin_new_loan_payment"
  match "/admin/loans/:loan_id/payments" => "custom/payments#create", :via=>:post, :as => "admin_create_loan_payment"
  match "/admin/loans/:loan_id/payments/:payment_id/edit" => "admin/payments#edit", :via=>:get, :as => "admin_edit_loan_payment"
  match "/admin/loans/:loan_id/payments/:payment_id" => "custom/payments#update", :via=>:put, :as => "admin_update_loan_payment"

  match "admin/attachments" => "custom/attachments#index", :via => :get
  match "admin/attachments" => "custom/attachments#create", :via => :post
  match "/admin/loans/:loan_id/payments" => "admin/payments#index", :via=> :get , :as => "admin_loan_payments"
#  resources :attachments

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
  # root :to => "welcome#index"
  root :to => "admin/dashboard#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
