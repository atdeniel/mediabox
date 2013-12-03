class Multimedia < ActiveRecord::Base

	def cantidadMultimedia

		cantidad = Multimedia.count
		return cantidad

	end

	def albumQuePertenece(idMultimedia)

		multimedia = Multimedia.find_by(id: idMultimedia)
		album = multimedia.fk_album
		return album
	end

	def nombreMultimedia(idMultimedia)
		multimedia =  Multimedia.find_by(id: idMultimedia)
		foto = multimedia.nombre
		return foto
	end 

	def multimedia(idMultimedia)
		multimedia = Multimedia.find_by(id: idMultimedia)
		return multimedia
	end

	def desactivarMultimedia(idMultimedia)
		multimedia = Multimedia.find_by(id: idMultimedia)
		multimedia.activo = "no"
		multimedia.save
	end

	def verActivoMultimedia(idMultimedia)
		multimedia = Multimedia.find_by(id: idMultimedia)
		return multimedia.activo
	end

	def usuarioQuePertenece(idMultimedia)

		multimedia = Multimedia.find_by(id: idMultimedia)
		idAlbum = multimedia.fk_album
		album = Album.find_by(id: idAlbum)
		return album.fk_usuario

	end

end
