class InstagramController < ApplicationController

    $lista
    $idAlbum

	def retornarFotos
		@hashtag = params[:hashtag]
		$idAlbum = params[:idAlbum]
		fotos = Instagram.tag_recent_media(@hashtag,options = {:count => 1000}) #los primeros 1000
        @listaFotos = fotos.sort_by {|hash| hash.likes["count"]}.uniq.reverse!
		$lista = @listaFotos

		render "/instagram/mostrarFotos"

	end


	def paginacion

		@siguientePagina = params[:i]
		@listaFotos = $lista
		render "/instagram/mostrarFotos"
	end

	def verFoto
		@idFoto = params[:i].to_i
		@listaFotos = $lista
		render "/instagram/verFoto"
	end

	def guardarFoto
		@listaFotos = $lista
		idFoto = params[:i]
		multimedia = Multimedia.new()
		multimedia.agregarMultimedia(@listaFotos[idFoto.to_i].images.low_resolution.url,$idAlbum,"Instagram")
		render "/instagram/mostrarFotos"
	end

end
