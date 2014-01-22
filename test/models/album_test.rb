require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
   test "nuevoAlbum" do
    	nuevo_album = Album.new()
    	nuevo_album.crearNuevoAlbum("album1","12-12-12","descripcion","lugar","imagen","privacudad",1)

    	verificar_album = Album.last

    	assert_equal("album1",verificar_album.nombre)

   end

   test "eliminar Album" do

   		album1 = Album.new()
   		album1.eliminarAlbum(1)

		assert_equal("no",Album.find(1).activo)

	end

	test "nombreAlbum" do

		album1 = Album.new()
		assert_equal("album1",album1.nombreAlbum(1))

	end

	test "fechaCreacionAlbum" do

		nuevo_album = Album.new()
    	nuevo_album.iniciarAlbum(1,1)
		assert_equal("Wed, 12 Dec 2012",nuevo_album.fechaCreacionAlbum)

	end
	
	test "descripcionAlbum" do

		nuevo_album = Album.new()
    	nuevo_album.iniciarAlbum(1,1)
		assert_equal("descripcion del album1",nuevo_album.descripcionAlbum)		

	end

	test "lugarAlbum" do

		nuevo_album = Album.new()
    	nuevo_album.iniciarAlbum(1,1)
		assert_equal("caracas",nuevo_album.lugarAlbum)			

	end

	test  "imagenAlbum" do

		album1 = Album.new()
		assert_equal("urlimagen2",album1.imagenAlbum(2))	

	end

	test "usuarioAlbum" do

		album1 = Album.new()
		assert_not_nil(album1.usuarioAlbum(1))			

	end

	test "privacidadAlbum" do

		nuevo_album = Album.new()
    	nuevo_album.iniciarAlbum(1,1)
		assert_equal("si",nuevo_album.privacidadAlbum)		

	end

	test "modificarNombreAlbum" do

		album1 = Album.new()
		album1.modificarNombreAlbum("nuevonombre",1)
		assert_equal("nuevonombre",Album.find(1).nombre)

	end

	test "modificarDescripcionAlbum" do

		album1 = Album.new()
		album1.modificarDescripcionAlbum("nuevadescripcion",1)
		assert_equal("nuevadescripcion",Album.find(1).descripcion)

	end

	test "modificarLugarAlbum" do

		album1 = Album.new()
		album1.modificarLugarAlbum("lugarnuevo",1)
		assert_equal("lugarnuevo",Album.find(1).lugar)

	end

	test "modificarPrivacidadAlbum" do

		album1 = Album.new()
		album1.modificarPrivacidadAlbum("no",1)
		assert_equal("no",Album.find(1).privacidad)

	end

	test "cantidadAlbumsTotal" do

		album1 = Album.new()
		assert_not_nil(album1.cantidadAlbumsTotal)

	end

	test "regresar album si la relacion Album Usuario existe" do

		album1 = Album.new()
		assert_not_equal("no",album1.regresarAlbumUsuario(1,1))

	end

	test "regresar no si la relacion Album Usuario no existe" do

		album1 = Album.new()
		assert_equal("no",album1.regresarAlbumUsuario(2,1))

	end

	test "nuevoComentario" do

		album1 = Album.new()
		album1.nuevoComentario("Este es un comentario de prueba unitaria",3,1,1)

		comentario1 = Comentario.last

		assert_equal("Este es un comentario de prueba unitaria",comentario1.coment)


	end

	test "nueva imagen del album" do
		
		album1 = Album.new()
		album1.ponerImagenAlbum(2,"nuevaURL")
		assert_equal("nuevaURL",Album.find(2).imagen)
	end

	test "dueño del album" do
		
		album1 = Album.new()

		assert_equal(Album.find(2).fk_usuario,album1.deQuienEsElAlbum(2))

	end

	test "playAlbumIs" do

		album1 = Album.new()
		assert_equal("no",album1.playAlbumIs(1))

	end



end
