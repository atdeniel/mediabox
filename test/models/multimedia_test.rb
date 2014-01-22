require 'test_helper'

class MultimediaTest < ActiveSupport::TestCase
 
  #Metodo para agregar las multimedias
  test "nuevaMultimedia" do
    multimedia = Multimedia.new()
    multimedia.agregarMultimedia("foto4",1,"instagram","foto")
    assert_not_nil(multimedia.save)
  end

  #Metodo que indica la cantidad de archivos multimedia
  test "cuentaMultimedia" do
    multimedia = Multimedia.new()
    multimedia.cantidadMultimedia()
    assert_equal(Multimedia.count,multimedia.cantidadMultimedia())
  end

    #Verificar album al que pertenece
    test "verificarAlbum" do
     multimedia = Multimedia.new()
     multimedia.albumQuePertenece(1)
     album = Album.new()
     album = Album.find(1)
     assert_equal(1,(multimedia.albumQuePertenece(1)))
    end

    #verificar el nombre de archivo Multimedia
    test "verificarMultimedia" do
      multimedia = Multimedia.new()
      multimedia.nombreMultimedia(1)
      assert_equal("foto",multimedia.nombreMultimedia(1))
    end

    #Multimedia 
    test "verMultimedia" do
      multimedia = Multimedia.new()
      multimedia.multimedia(1)
      assert_not_nil(multimedia)
      assert_equal(multimedia.multimedia(1),Multimedia.find(1))
    end

    #Validacion de desactivar el archivo de multimedia
    test "verificarDesactivarMultimedia" do
      multimedia = Multimedia.new()
      multimedia.desactivarMultimedia(1)
      assert_equal("no",Multimedia.find(1).activo)
    end

    #Archivos activos de multimedia
    test "activosMultimedia" do
      multimedia = Multimedia.new()
      multimedia.verActivoMultimedia(2)
      assert_equal("si",Multimedia.find(2).activo)
    end

    #Usuario al que pertenece
    test "usuarioDueno" do
      multimedia = Multimedia.new()
      multimedia.usuarioQuePertenece(1)
      album = Album.new()
      album = Multimedia.find(1).fk_album
      assert_equal(1,album)
    end
  end
