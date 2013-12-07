class Megusta < ActiveRecord::Base


	def tipoDeLikeDelUsuario(idComentario,idUsuario)

		megusta = Megusta.find_by(fk_usuario: idUsuario, fk_comentario: idComentario )

		if (megusta)

		if (megusta.tipo == "like")
			return "like"

		end

		if (megusta.tipo == "dislike")
			return "dislike"
		end

		else
		return "nada"
		end

	end

	def siUsuarioDioLike(idComentario,idUsuario)

		megusta = Megusta.find_by(fk_usuario: idUsuario, fk_comentario: idComentario )	

		if (megusta)
			if megusta.tipo=="unlike"
				return "no"
			else
				return "si"
			end
		else
			return "no"
		end

	end

	def darLike(idUsuario,idComentario)

		megusta = Megusta.find_by(fk_usuario: idUsuario ,fk_comentario:idComentario )

		if (!megusta)
			nuevoMegusta = Megusta.new tipo: "like", fk_usuario:idUsuario, fk_comentario:idComentario
			nuevoMegusta.new_record?
			nuevoMegusta.save
		else
		megusta.tipo = "like"
		megusta.save 		
		end

	end

	def darUnlike(idUsuario,idComentario)

		megusta = Megusta.find_by(fk_usuario: idUsuario ,fk_comentario:idComentario )

		if (!megusta)
			nuevoMegusta = Megusta.new tipo:"unlike", fk_usuario:idUsuario, fk_comentario:idComentario
			nuevoMegusta.new_record?
			nuevoMegusta.save
		else
		megusta.tipo = "unlike"
		megusta.save 		
		end


	end

	def darDislike(idUsuario,idComentario)

		megusta = Megusta.find_by(fk_usuario: idUsuario ,fk_comentario:idComentario )
		if (!megusta)
			nuevoMegusta = Megusta.new tipo:"dislike", fk_usuario:idUsuario, fk_comentario:idComentario
			nuevoMegusta.new_record?
			nuevoMegusta.save
		else			
		megusta.tipo = "dislike"
		megusta.save 	
		end

	end

	def cantidadLike(idComentario)

		megusta = Megusta.where(fk_comentario: idComentario, tipo:"like").count
		return megusta


	end

	def cantidadDislike(idComentario)

		megusta = Megusta.where(fk_comentario: idComentario, tipo:"dislike").count
		return megusta	

	end

	def regresarMegusta(idMegusta)

		megusta = Megusta.find_by(id: idMegusta)
		return megusta

	end

	def paraQuienEsElLike(idMegusta)

		megusta = Megusta.find_by(id: idMegusta)
		comentario = Comentario.new()
		idUsuario = comentario.quienHaceElComentario(megusta.fk_comentario)

		return idUsuario
	end

	def quienDaElLike(idMegusta)

		megusta = Megusta.find_by(id: idMegusta)
		return megusta.fk_usuario

	end

	def regresarTipoMegusta(idMegusta)

		megusta = Megusta.find_by(id: idMegusta)

		if (megusta.tipo == "like")
			return "like"
		end

		if (megusta.tipo == "dislike")
			return "dislike"
		end

		return "no"

	end

	def regresarComentarioDelLike(idMegusta)

		megusta = Megusta.find_by(id: idMegusta)
		return megusta.fk_comentario

	end

end
