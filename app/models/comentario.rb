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

end
