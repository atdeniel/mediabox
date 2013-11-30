class InstagramController < ApplicationController


	def retornarFotos
		##@hashtag = params[:hashtag]

#		fotos = Instagram.tag_recent_media(@hashtag,options = {:count => 10}) #los primeros 10
 #       @listaFotos = fotos.sort_by {|hash| hash.likes["count"]}.uniq.reverse!
	
		render "/instagram/mostrarFotos"

	end
end
