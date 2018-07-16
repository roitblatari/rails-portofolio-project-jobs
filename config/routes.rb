Rails.application.routes.draw do
  get 'session/new'
  get 'session/create'
  # get 'sessions/destroy'
  get '/signin', to: 'session#new'
  post '/signin', to: 'session#create'
  get '/logout', to: 'session#destroy'


  root to: 'static#welcome'

  delete '/employees/:id/jobs/:id', to: 'jobs#destroy', as:'delete_employee_job'

  post 'jobs/destroy' => 'sessions#destroy'

  get 'auth/:provider/callback', to: 'session#create'



  resources :employees do
    resources :jobs, only: [:edit, :update, :delete ,:destroy ,:index , :show ]
  end
   resources :jobs  , only: [ :index , :show ]

  resources :employers do
    resources :jobs
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

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
