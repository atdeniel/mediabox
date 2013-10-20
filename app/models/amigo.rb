class Amigo < ActiveRecord::Base

	attr_reader :usuarioSolicitaPeticion , :usuarioRecibePeticion

	def nuevaAmistad(usuarioSolicitaPeticion,usuarioRecibePeticion,fechaPeticion)
		nuevaAmistad = Amigo.new fk_usuario1:usuarioSolicitaPeticion, fk_usuario2:usuarioRecibePeticion, status:"pendiente", 
		               fecha:fechaPeticion, leido:"no"
     	nuevaAmistad.new_record?
		nuevaAmistad.save
	end




end
