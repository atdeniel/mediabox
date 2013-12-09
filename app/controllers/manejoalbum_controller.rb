class ManejoalbumController < ApplicationController

    $idAlbum

	def irAlbum
		$idAlbum = params[:id]
		render "/sessions/ver_album/"
	end

	def irEditarAlbum
		render "sessions/modificar_album/"
	end

	def desactivarAlbum

		album = Album.new()
		album.eliminarAlbum(params[:id])
		redirect_to '/sessions/albums_usuario'

	end

	def mostrarAlbumAmigo

		@paginacion = 1
		$idAmigo = params[:id]
		render '/manejoalbum/albums_amigo'

	end

	def nuevoComentario

		comentario = params[:comentario]
		idAlbum = params[:idAlbum]
		album = Album.new()
		album.nuevoComentario(comentario,current_user.id,idAlbum,"1")
		redirect_to '/sessions/ver_album/'+idAlbum;

	end

	def nuevoComentarioHome

		comentario = params[:comentario]
		idAlbum = params[:idAlbum]
		album = Album.new()
		album.nuevoComentario(comentario,current_user.id,idAlbum,"1")
		redirect_to '/sessions/home';

	end

	def verUnMultimediaDelAlbum

		contenidos = Multimedia.new()
        @idAlbum = contenidos. albumQuePertenece(params[:i]) 
		@multimedia = contenidos.multimedia(params[:i])
		render '/manejoalbum/verMultimedia'

	end

	def desactivarMultimedia

		multimedia = Multimedia.new()
		multimedia.desactivarMultimedia(params[:i])
		idAlbum = multimedia.albumQuePertenece(params[:i])
		redirect_to '/sessions/ver_album/'+idAlbum.to_s;
	end

	def ponerComoCover

		multimedia = Multimedia.new()
		idAlbum = multimedia.albumQuePertenece(params[:i])
		url = multimedia.multimedia(params[:i]).nombre
		album = Album.new()
		album.ponerImagenAlbum(idAlbum,url)
		redirect_to '/manejoalbum/verMultimedia/'+params[:i]

	end

	def siguientePagina

		@paginacion = params[:p].to_i
		render '/sessions/albums_usuario'

	end

	def verAlbumes
		redirect_to '/sessions/cargarAlbums/1'
	end

	def siguientePaginaAmigo
		@paginacion = params[:p].to_i
		render '/manejoalbum/albums_amigo'

	end


 	 def eliminarComentario

      comentarios = Comentario.new()
      comentario = comentarios.obtenerComentario(params[:i])

     if (comentario.fk_album != 0)

      albumQuePertenecio = comentario.fk_album
      comentario.fk_album = 0
      comentario.fk_usuario = 0
      comentario.save

     end

      render'/sessions/ver_album/'

  	end

end
