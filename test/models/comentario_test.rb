require 'test_helper'

class ComentarioTest < ActiveSupport::TestCase
   test "nuevoComentario" do
     
     	nuevo_comentario = Comentario.new()
     	nuevo_comentario.nuevo("Este es mi comentario",1,1,1)

     	verificar_comentario = Comentario.last

     	assert_equal("Este es mi comentario",verificar_comentario.coment)
   end 
   
   test "obtenerComentario" do

    obtener_comentario = Comentario.new()
    obtener_comentario = obtener_comentario.obtenerComentario(1)

    assert_not_nil(obtener_comentario)
   end

   test "cantidadComentario" do

    cantidad_comentario = Comentario.new()
    cantidad = cantidad_comentario.cantidadComentarioTotal()

    assert_equal(Comentario.count,cantidad)

   end

   test "paraQuienEsElComentario" do

    user_comentario = Comentario.new()
    id_amigo_comentario = user_comentario.paraQuienEsElComentario(2)

    assert_equal(2,id_amigo_comentario)

    end

  test "obtenerAlbum" do
    album_comentario = Comentario.new()
    id_album_comentario = album_comentario.obtenerAlbum(1)

    assert_not_nil(id_album_comentario)
  end

  test "quienHaceElComentario" do

    persona_comentario = Comentario.new()
    id_persona_comentario = persona_comentario.quienHaceElComentario(1)
    assert_equal(1,id_persona_comentario)

  end

  test "devolverFechaComentario" do

    fecha_comentario = Comentario.new()
    fecha_comentario = fecha_comentario.devolverFechaComentario(2)
    assert_equal(Comentario.find(2).created_at,fecha_comentario)
  end

end
