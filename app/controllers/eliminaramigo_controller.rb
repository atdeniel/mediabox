class EliminaramigoController < ApplicationController
	def eliminaramistad
		amigo = Amigo.new();
		amistad = amigo.eliminarAmigo(current_user.id,params[:idAmigo])
		redirect_to '/sessions/perfil_usuario'
	end
end
