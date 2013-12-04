# = album_rdoc.rb
#
# Autor:: Luz Eljuri, Vianny Molero, Jose Moros
# Web::     https://github.com/Skeitho/mediabox
#
# == User
#
# Con este modelo pretendemos:
# -Crear y eliminar Album de un usuario
# -Getters y Setters de los albums
# -Cantidad de albums de tiene un usuario
# -Dado un album, saber a que usuario le pertenece
#
# === Clase Album
# 
# Definicion de la clase _Album_ compuesta por
# *metodo crearNuevoAlbum
# *metodo iniciarAlbum
# *metodo eliminarAlbum
# *metodo nombreAlbum
# *metodo fechaCreacionAlbum
# *metodo descripcionAlbum
# *metodo lugarAlbum
# *metodo imagenAlbum
# *metodo usuarioAlbum
# *metodo privacidadAlbum
# *metodo modificarNombreAlbum
# *metodo modificarDescripcionAlbum
# *metodo modificarLugarAlbum
# *metodo modificarPrivacidadAlbum
# *metodo cantidadAlbumsTotal
# *metodo regresarAlbumUsuario
#

class Album < ActiveRecord::Base

	attr_reader :idAlbum, :idUsuario

	def crearNuevoAlbum (nombreAlbum,fechaCreacionAlbum,descripcionAlbum,lugarAlbum,imagenAlbum,privacidadAlbum,idUsuario)
		nuevoAlbum = Album.new nombre:nombreAlbum, fecha:fechaCreacionAlbum, descripcion:descripcionAlbum, lugar:lugarAlbum, 
		             imagen:imagenAlbum, privacidad:privacidadAlbum, fk_usuario:idUsuario, activo: "si"
		nuevoAlbum.new_record?
		nuevoAlbum.save
	end

	def iniciarAlbum (idUsuario, idAlbum)
		@idAlbum, @idUsuario = idAlbum, idUsuario
	end

	def eliminarAlbum(idAlbum)
		album = Album.find(idAlbum)
		album.activo = "no"
		album.save
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

	def imagenAlbum(idAlbum)
		imagen = Album.find(idAlbum).imagen
		return imagen
	end

	def usuarioAlbum(idAlbum)
		usuario = Album.find(idAlbum).fk_usuario
		return usuario
	end	

	def privacidadAlbum
		privacidad = Album.find(idAlbum).privacidad
		return privacidad
	end



	def modificarNombreAlbum (nuevoNombreAlbum,idAlbum)
		album = Album.find(idAlbum)
		album.nombre = nuevoNombreAlbum
		album.save
	end

	def modificarDescripcionAlbum (nuevaDescripcionAlbum,idAlbum)
		album = Album.find(idAlbum)
		album.descripcion = nuevaDescripcionAlbum
		album.save
	end

	def modificarLugarAlbum (nuevolugarAlbum,idAlbum)
		album = Album.find(idAlbum)
		album.lugar = nuevolugarAlbum
		album.save
	end

	def modificarPrivacidadAlbum (nuevaPrivacidadAlbum,idAlbum)
		album = Album.find(idAlbum)
		album.privacidad = nuevaPrivacidadAlbum
		album.save
	end

	def cantidadAlbumsTotal
		album = Album.count
		if (album)
		return album
	else
		return 0
	end
	end

	def regresarAlbumUsuario(idUsuario,idAlbum)
		album = Album.find_by(fk_usuario: idUsuario,id: idAlbum)
		if (album and album.activo == 'si')
		return album
		else
		return "no"
		end
	end


	def nuevoComentario(comentario,idUsuario,idAlbum,nivel)
		nuevoComentario = Comentario.new()
		nuevoComentario.nuevo(comentario,idUsuario,idAlbum,nivel)
	end

	def ponerImagenAlbum(idAlbum,urlImagen)

		album = Album.find_by(id: idAlbum)
		album.imagen = urlImagen
		album.save

	end

end
