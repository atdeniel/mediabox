require 'test_helper'

class AmigoTest < ActiveSupport::TestCase
   test "nuevoAmigo" do
    	nuevo_amigo = Amigo.new()
    	nuevo_amigo.nuevaAmistad(1,2,"12-12-12")

    	verificar_amigo = Amigo.last

    	assert_equal(1,verificar_amigo.fk_usuario1)

   end
end
