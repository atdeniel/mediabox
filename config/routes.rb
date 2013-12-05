Project::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'sessions#entrar'
  
  get "sessions/index"

  get "sessions/entrar"
  get "sessions/home"

  get "sessions/crear_album"
  
  get "sessions/albums_usuario" => 'manejoalbum#verAlbumes'
  get "sessions/perfil_usuario"
  
  get "sessions/perfil_privado"
  get "sessions/perfil_publico"
  get "sessions/perfil_noexiste"
  
  get "sessions/amigos_usuario" => 'manejoamigo#verAmigos'
  get "sessions/notificador"

  get "sessions/modificar_album"
  get "sessions/perfil_modificar"

  get "sessions/ver_album"
  get "sessions/seleccionarUsuario"
  #get "manejoalbum/desactivarAlbum"
  get  "buscaramigo/buscarAmigo"
  get  "manejoalbum/albums_amigo"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get 'sessions/perfil_privado/:id' => 'irperfilusuario#irPerfilPrivado'
  get 'sessions/perfil_publico/:id' => 'irperfilusuario#irPerfilPublico'

  ##
  get 'sessions/notificador/:id' => 'manejoamigo#confirmarSolicitudAmistad'
  get 'sessions/perfil_privado/:id/mandarSerAmigo' => 'manejoamigo#mandarOconfirmarSolicitudAmistad'
  ##

  get '/sessions/ver_album/:id' => 'manejoalbum#irAlbum'
  get '/sessions/modificar_album/:id' => 'manejoalbum#irEditarAlbum'
  get '/manejoalbum/desactivarAlbum/:id' => 'manejoalbum#desactivarAlbum'

  get '/manejoalbum/albums_amigo/:id' => 'manejoalbum#mostrarAlbumAmigo'

  #paginacion instagram

  get '/instagram/mostrarFotos/:i' => 'instagram#paginacion'

  #ver standard foto instagram
  get '/instagram/verFoto/:i' => 'instagram#verFoto'

  #ver foto de un album
  get '/manejoalbum/verMultimedia'
  get '/manejoalbum/verMultimedia/:i' => 'manejoalbum#verUnMultimediaDelAlbum'

  #eliminar un multimedia
  get '/manejoalbum/desactivarMultimedia/:i' => 'manejoalbum#desactivarMultimedia'

  #guardar foto instagram
  get 'instagram/guardarFoto/:i' => 'instagram#guardarFoto'

  #poner imagen como imagen del album
  get '/manejoalbum/ponerComoCover/:i' => 'manejoalbum#ponerComoCover'

  #paginacion de albums
  get '/sessions/cargarAlbums/:p' => 'manejoalbum#siguientePagina'
  get '/sessions/cargarAlbumsAmigo/:p' => 'manejoalbum#siguientePaginaAmigo'

  #paginacion de amigos
  get '/sessions/cargarAmigos/:p' => 'manejoamigo#siguientePagina'

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
  
#si quiero pasarle varios parametros utilizo match, es pra form!!!
match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
match 'auth/failure', to: redirect('/'), via: [:get, :post]
match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

match '/sessions/guardarDatos', to: 'guardardatos#guardarDatosUsuario', via: [:get,:post]
match '/sessions/guardarDatosAlbum', to: 'guardardatos#crearAlbumUsuario', via: [:get, :post]
match '/sessions/guardarModificacionAlbum', to: 'guardardatos#modificarAlbum', via: [:get, :post]
match '/buscaramigo/privadoauxiliar' , to:  'buscaramigo#buscarAmigo', via: [:get,:post]
match '/buscaramigo/eliminaramigo', to: 'eliminaramigo#eliminaramistad', via: [:get,:post]

match '/manejoalbum/agregarComentario', to: 'manejoalbum#nuevoComentario', via: [:get]

#INSTAGRAM
match '/instagram/mostrarFotos', to: 'instagram#retornarFotos', via: [:get]

#Agregar al album
match '/instagram/guardarDatos', to: 'instagram#guardarFoto', via: [:get]

#INSTAGRAM desde el album
match '/instagram/mostrarFotos', to: 'instagram#retornarFotos', via:[:get]
end
