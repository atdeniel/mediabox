class ManejomegustaController < ApplicationController

	def darLike

		megusta = Megusta.new()
		megusta.darLike(current_user.id,params[:i])

		comentario = Comentario.new()
		idAlbum = comentario.obtenerAlbum(params[:i])

		redirect_to '/sessions/ver_album/'+idAlbum.to_s


	end


	def darDislike
		megusta = Megusta.new()
		megusta.darDislike(current_user.id,params[:i])

		comentario = Comentario.new()
		idAlbum = comentario.obtenerAlbum(params[:i])

		redirect_to '/sessions/ver_album/'+idAlbum.to_s
	end


	def darUnlike
		megusta = Megusta.new()
		megusta.darUnlike(current_user.id,params[:i])

		comentario = Comentario.new()
		idAlbum = comentario.obtenerAlbum(params[:i])

		redirect_to '/sessions/ver_album/'+idAlbum.to_s
	end

end
