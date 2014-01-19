require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
   test "nuevoAlbum" do
    	nuevo_album = Album.new()
    	nuevo_album.crearNuevoAlbum("album1","12-12-12","descripcion","lugar","imagen","privacudad",1)

    	verificar_album = Album.last

    	assert_equal("album1",verificar_album.nombre)

   end
end
