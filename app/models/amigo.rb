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

end
