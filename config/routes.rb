Sapo::Application.routes.draw do
  resources :players

  resources :teams

  resources :games


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'games#home'
  get "/teams/new/:id", controller:"teams",action: :new
  get "/players/new/:id", controller:"players",action: :new
  get "/play/:id", controller:"games",action: :play, as: :play
  get "/winner/:id",controller:"games",action: :winner, as: :winner
  post "/add_points/:id", controller:"games",action: :add_points, as: :add_points
  get "/restart/:id", controller:"games",action: :restart, as: :restart
  get "/top_players", controller:"players",action: :top_players, as: :top_players
  get "/top_teams", controller:"teams",action: :top_teams, as: :top_teams
  get "/top_games", controller:"games",action: :top_games, as: :top_games
  get "/how_to", controller:"information",action: :how_to, as: :how_to
  get "/what",controller:"information",action: :what, as: :what
  post "/undo/:id", controller:"games",action: :undo, as: :undo
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
