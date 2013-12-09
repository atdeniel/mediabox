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

  def crearAlbumUsuario

        nuevoAlbum = Album.new.crearNuevoAlbum(params[:nombre],"12-12-12",params[:descripcion],params[:lugar],params[:imagen],"si",current_user.id)

        redirect_to '/sessions/cargarAlbums/1'
  end

  def modificarAlbum

      albumEditar = Album.new()
      albumEditar.modificarNombreAlbum(params[:nombre],params[:id])
      albumEditar.modificarDescripcionAlbum(params[:descripcion],params[:id])
      albumEditar.modificarLugarAlbum(params[:lugar],params[:id])
      albumEditar.modificarPrivacidadAlbum(params[:privacidad],params[:id])
      if (params[:privacidad] != "si")
          params[:privacidad] = "no"
          albumEditar.modificarPrivacidadAlbum(params[:privacidad],params[:id])
      end
      redirect_to '/sessions/ver_album/'+params[:id] 
        
  end
end
