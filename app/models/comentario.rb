class Comentario < ActiveRecord::Base


	def nuevo(comentario,idUsuario,idAlbum, nivel)

		nuevoComentario = Comentario.new coment:comentario, fk_album:idAlbum, fk_usuario:idUsuario, nivel:nivel
        nuevoComentario.new_record?
		nuevoComentario.save
	end	

	def obtenerComentario(idComentario)

		comentario = Comentario.find_by(id: idComentario)
		return comentario

	end

	def cantidadComentarioTotal
		total = Comentario.count
		if (total)
			return total
		else
			return 0
		end
	end

	def paraQuienEsElComentario(idComentario)

		idAlbum = obtenerAlbum(idComentario)
		
     	album = Album.new()
		idUsuario = album.deQuienEsElAlbum(idAlbum)
		return idUsuario

	end

	def obtenerAlbum(idComentario)

		comentario = Comentario.find_by(id: idComentario)
		idAlbum = comentario.fk_album
		return idAlbum

	end

	def quienHaceElComentario(idComentario)

		comentario = Comentario.find_by(id: idComentario)
		return comentario.fk_usuario	

	end

end
