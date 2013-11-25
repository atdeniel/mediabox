class BuscaramigoController < ApplicationController

	def buscarAmigo

	
	    @nombreUsuario =params[:email]
#	    idAmigo = current_user.buscarIdPorCorreo(params[:email])

#		verificar = current_user.verificarAmistad(current_user.id, params[:email])
#
#		if (verificar == "no")
#			redirect_to '/sessions/perfil_privado/'+idAmigo.to_s
#		end
#		if (verificar == "si")
#			redirect_to '/sessions/perfil_publico/'+idAmigo.to_s
#		end
#		if (verificar == "no existe") 
#			redirect_to '/sessions/perfil_noexiste/'
#		end
			
		#redirect_to '/buscaramigo/buscarAmigo'

	end
end
