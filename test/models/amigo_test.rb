require 'test_helper'

class AmigoTest < ActiveSupport::TestCase
   test "nuevoAmigo" do
    	nuevo_amigo = Amigo.new()
    	nuevo_amigo.nuevaAmistad(1,2,"12-12-12")

    	verificar_amigo = Amigo.last

    	assert_equal(1,verificar_amigo.fk_usuario1)
   end

   test "eliminarAmistad" do
   		eliminar_amigo = Amigo.new()
   		eliminar_amigo.eliminarAmistad(3,4)

   		assert_nil(Amigo.find_by(fk_usuario1: 3, fk_usuario2: 4))
   end

   test "cambiarStatusParaAmigo" do

      eliminar_amigo = Amigo.new()
      eliminar_amigo.cambiarStatusParaAmigo(1,3)

      assert_equal("amigo",Amigo.find_by(fk_usuario1: 1, fk_usuario2: 3).status)
   end

   test "cambiarLeido" do

      amigo = Amigo.new()
      amigo.cambiarLeido(1,3)

      assert_equal("pendiente",Amigo.find(3).status)
   end

   test "eliminarAmigo" do
      amigo = Amigo.new()
      amigo.eliminarAmigo(1,3)

      assert_equal("eliminado",Amigo.find(3).status)
   end

   test "verEnvioSolicitud" do
      amigo = Amigo.new()
      amigo.verSiMandeSolicitud(1,3)
      assert_equal("Friend Request Send",amigo.verSiMandeSolicitud(1,3))
   end

   test "verAmistad" do
    amigo = Amigo.new()
    amigo.verAmistad(1)
    assert_not_nil(1)
   end
end
