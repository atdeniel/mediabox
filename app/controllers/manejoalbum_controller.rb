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

end
