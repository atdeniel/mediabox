class Amigo < ActiveRecord::Base

	/attr_reader :usuarioSolicitaPeticion , :usuarioRecibePeticion/

	def nuevaAmistad(usuarioSolicitaPeticion,usuarioRecibePeticion,fechaPeticion)
		nuevaAmistad = Amigo.new fk_usuario1:usuarioSolicitaPeticion, fk_usuario2:usuarioRecibePeticion, status:"pendiente",
		               fecha:fechaPeticion, leido:"no"
     	nuevaAmistad.new_record?
		nuevaAmistad.save
	end

	def eliminarAmistad(usuarioSolicitaPeticion,usuarioRecibePeticion)
		amistad = Amigo.find_by(fk_usuario1: usuarioSolicitaPeticion, fk_usuario2: usuarioRecibePeticion)
        amistad.destroy
    end

	def cambiarStatusParaAmigo(usuarioSolicitaPeticion,usuarioRecibePeticion)
		amistad = Amigo.find_by(fk_usuario1: usuarioSolicitaPeticion, fk_usuario2: usuarioRecibePeticion)
		if (amistad)
		amistad.status = "amigo"
		amistad.save
	end
	end

	def cambiarLeido(usuarioSolicitaPeticion,usuarioRecibePeticion)
		amistad = Amigo.find_by(fk_usuario1: usuarioSolicitaPeticion, fk_usuario2: usuarioRecibePeticion)
		amistad.leido="si"
    end

    def eliminarAmigo (idUsuario,idAmigo)
		amistad = Amigo.find_by(fk_usuario1: idAmigo, fk_usuario2: idUsuario)
		amistad1 = Amigo.find_by(fk_usuario1: idUsuario, fk_usuario2: idAmigo)
		if (amistad) && !(amistad1)
			if (amistad.status = "amigo")
				amistad.status = "eliminado"
				amistad.save
			end
		else	
			if (amistad1) && !(amistad)
				if (amistad1.status = "amigo")
					amistad1.status = "eliminado"
					amistad1.save
				end
			end
		end
	end

end
