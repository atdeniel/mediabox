class IrperfilusuarioController < ApplicationController

def irPerfilPrivado
	if (params[:id] == current_user.id.to_s)
		redirect_to '/sessions/perfil_usuario'
	else
render '/sessions/perfil_privado'
end

end

def irPerfilPublico
render '/sessions/perfil_publico'
end




end
