class IrperfilusuarioController < ApplicationController

def irPerfilPrivado
render '/sessions/perfil_privado'
end

def irPerfilPublico
render '/sessions/perfil_publico'
end


end
