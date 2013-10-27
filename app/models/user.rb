class User < ActiveRecord::Base

	def self.from_omniauth(auth)
		where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
			user.provider = auth.provider
			user.uid = auth.uid
			user.name = auth.info.name
			user.first_name = auth.info.first_name
			user.last_name = auth.info.last_name
			user.location = auth.info.location
			user.description = auth.info.description
			user.image = auth.info.image
			user.phone = auth.info.phone
			user.email = auth.info.email
			user.oauth_token = auth.credentials.token
			user.oauth_expires_at = Time.at(auth.credentials.expires_at)
			user.privacity = 'privado'
			user.save!
		end
	end

	def modificarNombreApellido(nuevoNombreApellido,idUsuario)
		usuario = User.find(idUsuario)
		usuario.name = nuevoNombreApellido
		usuario.save
	end

	def modificarNombreUsuario(nuevoNombre,nuevoApellido,idUsuario)
		usuario = User.find(idUsuario)
		usuario.first_name=nuevoNombre
		usuario.last_name=nuevoApellido
		usuario.save
	end

	def modificarLugar(nuevoLugar,idUsuario)
		usuario = User.find(idUsuario)
		usuario.location = nuevoLugar
		usuario.save
	end

	def modificarDescripcion (nuevaDescripcion, idUsuario)
		usuario = User.find(idUsuario)
		usuario.description = nuevaDescripcion
		usuario.save
	end	

	def modificarFoto (nuevaFoto, idUsuario)
		usuario = User.find(idUsuario)
		usuario.image = nuevaFoto
		usuario.save
	end

	def modificarEmail (nuevoEmail, idUsuario)
		usuario = User.find(idUsuario)
		usuario.email = nuevoEmail
		usuario.save
	end

	def modificarTelefono (nuevoTelefono, idUsuario)
		usuario = User.find(idUsuario)
		usuario.phone = nuevoTelefono
		usuario.save
	end

	def modificarFavorito (nuevoFavorito, idUsuario)
		usuario = User.find(idUsuario)
		usuario.favorite = nuevoFavorito
		usuario.save
	end

	def eliminarUsuario (idUsuario)
		usuario = Usuario.find(idUsuario)
		usuario.destroy
	end

	def cantidadNotificacion
	    cantidad = Amigo.count
	return cantidad
	end

	def idUsuarioQueMeNotifica (numeroNotificacion, idUsuario)
		amigo = Amigo.find_by(id: numeroNotificacion, fk_usuario2: idUsuario, status: 'pendiente')	
		if (amigo)
    	return amigo.fk_usuario1
    else
    	return "no"
    end
	end	

	def nombreUsuario (idUsuario)
	    usuario = User.find(idUsuario)
   	    return usuario.name
	end

	def imagenUsuario (idUsuario)
		usuario = User.find(idUsuario)
		return usuario.image
	end

	def verPrivacidad (idUsuario)
		usuario = User.find(idUsuario)
		return usuario.privacity
	end

	def verDescripcion (idUsuario)
		usuario = User.find(idUsuario)
		return usuario.description
	end

    def verFavorito (idUsuario)
		usuario = User.find(idUsuario)
		return usuario.favorite
	end

	def buscarIdPorCorreo (email)
		usuario = User.find_by(email: email)
		if (usuario)
			return usuario.id
		else 
			return "no"
		end
	end
	
	def verificarAmistad(idUsuario,email)
		idamigo = User.find_by(email: email)

		if (idamigo)
			amistad1 = Amigo.find_by(fk_usuario1: idUsuario, fk_usuario2: idamigo.id)
			amistad2 = Amigo.find_by(fk_usuario1: idamigo.id, fk_usuario2: idUsuario)
			

			if (amistad1) && !(amistad2)
				if (amistad1.status == "amigo")
					return "si"
				else
					return "no"
				end
		    else
				if (amistad2) && !(amistad1)
					if (amistad2.status == "amigo")
						return "si"
					else
						return "no"
					end
				else
					return "no"
				end
			end
		else
			return "no existe"
		end
	end


end