class ManejoalbumController < ApplicationController


	def irAlbum

		render "sessions/ver_album/"
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

		@idAmigo = params[:id]
		render '/manejoalbum/albums_amigo'

	end

	def nuevoComentario

		comentario = params[:comentario]
		idAlbum = params[:idAlbum]
		album = Album.new()
		album.nuevoComentario(comentario,current_user.id,idAlbum,"1")
		redirect_to '/sessions/ver_album/'+idAlbum;

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

end
