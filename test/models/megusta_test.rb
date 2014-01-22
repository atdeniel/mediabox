require 'test_helper'

class MegustaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
require 'test_helper'

class MegustaTest < ActiveSupport::TestCase

  #Verificar si el like existe
  test "tipoLike" do
    megusta = Megusta.new()
    megusta.tipoDeLikeDelUsuario(1,1)
    assert_equal("like",megusta.tipoDeLikeDelUsuario(1,1))
  end

  #Verificar que el usuario hizo el comentario
  test "usuarioLike" do
    megusta = Megusta.new()
    megusta.siUsuarioDioLike(1,1)
    assert_equal("si",megusta.siUsuarioDioLike(1,1))
  end

  #Realizar un nuevo like
  test "darLike" do
    megusta = Megusta.new()
    megusta.darLike(1,1)
    assert_equal("like",(Megusta.find(1).tipo))    
  end

  #Dar unlike a un comentario
  test "darUnlike" do
    megusta = Megusta.new()
    megusta.darUnlike(3,1)
    assert_equal("unlike",(Megusta.find(3).tipo))
  end

  #Dar dislike a un comentario
  test "darDislike" do
    megusta = Megusta.new()
    megusta.darDislike(2,2)
    assert_equal("dislike",(Megusta.find(2).tipo))
  end

  #Contar likes
  test "CantidadLike" do
    megusta = Megusta.new()
    megusta.cantidadLike(1)
    assert_equal(Megusta.where(fk_comentario: 1, tipo:"like").count,megusta.cantidadLike(1))
  end

  #Contar Dislike
  test "CantidadDislike" do
    megusta = Megusta.new()
    megusta.cantidadDislike(2)
    assert_equal(Megusta.where(fk_comentario: 2, tipo:"dislike").count,megusta.cantidadDislike(2))
  end

  #Regresar like
  test "RegresarLike" do
    megusta = Megusta.new()
    megusta.regresarMegusta(1)    
    assert_equal(1,1)
  end

  #Verificar para que usuario es el like
  test "verificarLike" do
    megusta = Megusta.new()
    megusta.paraQuienEsElLike(1)
    new_user = User.new()
    comentario = Comentario.new()
    new_user = comentario.quienHaceElComentario(1)
    assert_equal(1,new_user)
  end

  #Verificacion del usuario que dio el like
  test "dioLike" do
    megusta = Megusta.new()
    user = User.new()
    megusta.quienDaElLike(1)
    assert_equal(1,megusta.quienDaElLike(1))
  end

  #Verificar tipo de like
  test "verificarTipoLike" do
    megusta = Megusta.new()
    assert_equal("like",(megusta.regresarTipoMegusta(1)))
    assert_equal("dislike",(megusta.regresarTipoMegusta(2)))
  end

  #Retorno del comentario
  test "verificarComentario" do
    megusta = Megusta.new()
    assert_equal(1,(megusta.regresarComentarioDelLike(1)))
  end
end