class GuardardatosController < ApplicationController

  def guardarDatosUsuario

  	    nombreNuevo = params[:names]
        lugarNuevo = params[:location]
        emailNuevo = params[:email]
        telefonoNuevo = params[:phone]
        descripcionNuevo = params[:description]
        favoritoNuevo = params[:favorite]


        current_user.modificarNombreApellido(nombreNuevo,current_user.id)
        current_user.modificarLugar(lugarNuevo,current_user.id)
        current_user.modificarDescripcion(descripcionNuevo,current_user.id)
        current_user.modificarEmail(emailNuevo,current_user.id)
        current_user.modificarTelefono(telefonoNuevo,current_user.id)
        current_user.modificarFavorito(favoritoNuevo,current_user.id)

        redirect_to '/sessions/perfil_modificar'

  end
	
end
