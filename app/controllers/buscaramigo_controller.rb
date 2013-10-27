class BuscaramigoController < ApplicationController

	def buscarAmigo

		idUsuario = current_user.buscarIdPorCorreo(params[:email])

		redirect_to '/sessions/perfil_privado/'+idUsuario.to_s

	end
end
