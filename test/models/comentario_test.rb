require 'test_helper'

class ComentarioTest < ActiveSupport::TestCase
   test "nuevoComentario" do
     
     	nuevo_comentario = Comentario.new()
     	nuevo_comentario.nuevo("Este es mi comentario",1,1,1)

     	verificar_comentario = Comentario.last

     	assert_equal("Este es mi comentario",verificar_comentario.coment)


   end
end
