BtcjamClient::Application.routes.draw do
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
  #
  match 'authenticated_calls/:api' => 'api#authenticated_calls', :as => :authenticated_calls
  match 'invest_call/:api' => 'api#invest_call', :as => :invest_call
  match 'reference_calls/:api' => 'api#reference_calls', :as => :reference_calls
  match 'multi_payment_calls' => 'api#multi_payment_calls', :as => :multi_payment_calls
  match 'open_calls/:api' => 'api#open_calls', :as => :open_calls
  match 'new_user_calls/:api' => 'api#new_user_calls', :as => :new_user_calls 
  match 'new_id_calls/:api' => 'api#new_id_calls', :as => :new_id_calls
  match 'new_addr_calls/:api' => 'api#new_addr_calls', :as => :new_addr_calls
  match 'new_credit_calls/:api' => 'api#new_credit_calls', :as => :new_credit_calls 
  match 'new_phone_calls/:api' => 'api#new_phone_calls', :as => :new_phone_calls
  match 'phone_confirmation_calls/:api' => 'api#phone_confirmation_calls', :as => :phone_confirmation_calls  
  match 'phone_resend_sms_calls/:api' => 'api#phone_resend_sms_calls', :as => :phone_resend_sms_calls
  match 'user_change_calls/:api' => 'api#user_change_calls', :as => :user_change_calls
  match 'withdraw_calls/:api' => 'api#withdraw_calls', :as => :withdraw_calls
  match 'credit_report_calls/:api' => 'api#credit_report_calls', :as => :credit_report_calls
  match 'new_listing_calls/:api' => 'api#new_listing_calls', :as => :new_listing_calls 
  match 'activate_listing' => 'api#activate_listing', :as => :activate_listing 
  match 'new_lead_listing_calls/:api' => 'api#new_lead_listing_calls', :as => :new_lead_listing_calls  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_scope :user do
    delete "/logout" => "devise/sessions#destroy"
  end

  resources :references
  resources :multi_payments
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
