class Album < ActiveRecord::Base

	attr_reader :idAlbum, :idUsuario

	def crearNuevoAlbum (nombreAlbum,fechaCreacionAlbum,descripcionAlbum,lugarAlbum,imagenAlbum,privacidadAlbum,idUsuario)
		nuevoAlbum = Album.new nombre:nombreAlbum, fecha:fechaCreacionAlbum, descripcion:descripcionAlbum, lugar:lugarAlbum, 
		             imagen:imagenAlbum, privacidad:privacidadAlbum, fk_usuario:idUsuario
		nuevoAlbum.new_record?
		nuevoAlbum.save
	end

	def iniciarAlbum (idUsuario, idAlbum)
		@idAlbum, @idUsuario = idAlbum, idUsuario
	end

	def eliminarAlbum
		album = Album.find(idAlbum)
		album.destroy
	end

	def nombreAlbum
		nombre = Album.find(idAlbum).nombre
		return nombre 
	end

	def fechaCreacionAlbum
	    fecha = Album.find(idAlbum).fecha
	    return fecha	
	end

	def descripcionAlbum
	    descripcion = Album.find(idAlbum).descripcion
		return descripcion
	end

	def lugarAlbum
	    lugar = Album.find(idAlbum).lugar		
		return lugar
	end

	def imagenAlbum
		imagen = Album.find(idAlbum).imagen
		return imagen
	end

	def usuarioAlbum
		usuario = Album.find(idAlbum).fk_usuario
		return usuario
	end	

	def modificarNombreAlbum (nuevoNombreAlbum)
		album = Album.find(idAlbum)
		album.nombre = nuevoNombreAlbum
		album.save
	end

	def modificarDescripcionAlbum (nuevaDescripcionAlbum)
		album = Album.find(idAlbum)
		album.descripcion = nuevaDescripcionAlbum
		album.save
	end

	def modificarLugarAlbum (nuevolugarAlbum)
		album = Album.find(idAlbum)
		album.lugar = nuevolugarAlbum
		album.save
	end

	def modificarPrivacidadAlbum (nuevaPrivacidadAlbum)
		album = Album.find(idAlbum)
		album.privacidad = nuevaPrivacidadAlbum
		album.save
	end


end
