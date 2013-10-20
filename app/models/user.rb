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
			user.save!
		end
	end

	def modificarNombreUsuario(nuevoNombre,nuevoApellido,idUsuario)
		usuario = User.find(idUsuario)
		usuario.first_name=nuevoNombre
		usuario.last_name=nuevoApellido
		usuario.save
	end

	def modificarLugar(nuevoLugar,idUsuario)
		usuario = User.find(idUsuario)
		usuario.lugar = nuevoLugar
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

	def eliminarUsuario (idUsuario)
		usuario = Usuario.find(idUsuario)
		usuario.destroy
	end


end