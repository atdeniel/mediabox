class InstagramController < ApplicationController

    $lista #lista de instagram
    $listaYoutube
    $listaSoundcloud

    $idAlbum

	def retornarFotos
		@hashtag = params[:hashtag]
		$idAlbum = params[:idAlbum]
		fotos = Instagram.tag_recent_media(@hashtag,options = {:count => 1000}) #los primeros 1000
        @listaFotos = fotos.sort_by {|hash| hash.likes["count"]}.uniq.reverse!
		$lista = @listaFotos

		#youtube
		clientYoutube = YouTubeIt::Client.new(:dev_key => "AI39si4H7fYAofMrUCw4FH44Kbr6vBESMPQjrjaYiVhTa7M5qY8i068TlTWpa0dDc7T1jassdrt9UN6KZzn0tTiLcIUXBkyyRw")
		$listaYoutube = clientYoutube.videos_by(:query =>  @hashtag )

		#soundcloud
		clientSoundcloud = Soundcloud.new(:client_id => 'feac40d60730809e9ca3cdae19f9259d')
		$listaSoundcloud = clientSoundcloud.get('/tracks', :limit => 200, :order => @hashtag);


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
		multimedia.agregarMultimedia(@listaFotos[idFoto.to_i].images.low_resolution.url,$idAlbum,"Instagram","Foto")
		render "/instagram/mostrarFotos"
	end

	def guardarVideo
		@listaFotos = $lista
		idVideo = params[:i]
		multimedia = Multimedia.new()
		multimedia.agregarMultimedia(idVideo,$idAlbum,"Youtube","Video")
		render "/instagram/mostrarFotos"

	end

	def guardarSonido
		@listaFotos = $lista
		idSonido = params[:i]
		multimedia = Multimedia.new()
		multimedia.agregarMultimedia(idSonido,$idAlbum,"Soundcloud","Sonido")
		render "/instagram/mostrarFotos"
	end


	def verYoutube

		@idYoutube = params[:i]
		render "/instagram/verYoutube"

	end

	def verSouncloud

		@idSoundcloud = params[:i]
		render "/instagram/verSoundcloud"

	end

end
