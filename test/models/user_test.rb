require 'test_helper'

class UserTest < ActiveSupport::TestCase
	
	#test "prueba" do
		
	#	new_user = User.new()
	#	assert_not_nil (new_user.save)
		
		#new_user2 = User.find_by(name: "LUZ")
		#assert_nil (new_user2)

	#	new_user.modificarNombreApellido("Daniel",1)

	#	new_user3 = User.find(1)

	#	assert_not_equal("Daniel",new_user3.name)
	
	#end

	test "modificarNombre" do

		new_user = User.new()
		new_user.modificarNombreApellido("Daniel",1)
		assert_equal("Daniel",new_user.nombreUsuario(1))

	end

	test "modificarNombreApellido" do

		new_user = User.new()
		new_user.modificarNombreUsuario("Nombre","Apellido",1)
		new_user2 = User.find(1)
		assert_equal("Nombre",new_user2.first_name)
		assert_equal("Apellido",new_user2.last_name)	
	end
	
	test "modificarNombreLugar" do

		new_user = User.new()
		new_user.modificarLugar("Bariloche",1)
		new_user2 = User.find(1)
		assert_equal("Bariloche",new_user2.location)

	end

	test "modificarDescripcion" do

		new_user = User.new()
		new_user.modificarDescripcion("Descripcion",1)
		new_user2 = User.find(1)
		assert_equal("Descripcion",new_user2.description)
	end

	test "modificarForo" do

		new_user = User.new()
		new_user.modificarFoto("URLphoto",1)
		new_user2 = User.find(1)
		assert_equal("URLphoto",new_user2.image)

	end

	test "modificarEmail" do

		new_user = User.new()
		new_user.modificarEmail("correo@dominio.com",1)
		new_user2 = User.find(1)
		assert_equal("correo@dominio.com",new_user2.email)

	end	

	test "modificarTelefono" do

		new_user = User.new()
		new_user.modificarTelefono("584421428",1)
		new_user2 = User.find(1)
		assert_equal("584421428",new_user2.phone)
	
	end

	test "modificarFavorito" do

		new_user = User.new()
		new_user.modificarFavorito("cartas",1)
		new_user2 = User.find(1)
		assert_equal("cartas",new_user2.favorite)

	end

	test "eliminarUsuario" do

		new_user = User.new name:"usuario"
		new_user.new_record?
		new_user.save!

		new_user2 = User.last
		idusuario2 = new_user2.id

		metodoUser = User.new()
		metodoUser.eliminarUsuario(new_user2.id)

		new_user3 = User.last

		assert_not_equal(idusuario2,new_user3.id)

	end

	test "cantidadNotificacion" do

		new_user = User.new()
		assert_not_nil(new_user.cantidadNotificacion)

	end

	test "Quien Me Notifico" do

		nuevaAmistad = Amigo.new fk_usuario1:1, fk_usuario2:2, status:"pendiente",
		            fecha:"12-12-12", leido:"no"
     	nuevaAmistad.new_record?
		nuevaAmistad.save

		new_user = User.new()
		assert_not_nil(new_user.idUsuarioQueMeNotifica(Amigo.last,1))


	end

	test "No tengo notiicaciones" do

		nuevaAmistad = Amigo.new fk_usuario1:1, fk_usuario2:2, status:"pendiente",
		            fecha:"12-12-12", leido:"no"
     	nuevaAmistad.new_record?
		nuevaAmistad.save

		new_user = User.new()
		assert_equal(new_user.idUsuarioQueMeNotifica(Amigo.last,3),"no")


	end

	test "getters" do

		new_user = User.new()

		assert_equal(new_user.nombreUsuario(3),User.find(3).name) 
		assert_equal(new_user.imagenUsuario(3),User.find(3).image)
		assert_equal(new_user.verPrivacidad(3),User.find(3).privacity)
		assert_equal(new_user.verDescripcion(3),User.find(3).description)
		assert_equal(new_user.verFavorito(3),User.find(3).favorite)

	end

	test "si encuentra el correo" do

		new_user = User.new()

		assert_not_nil (new_user.buscarIdPorCorreo("jdanielm90@hotmail.com"))

	end

	test "si no encuentra el correo" do
		new_user = User.new()

		assert_equal(new_user.buscarIdPorCorreo("esteesuncorreoquenoexiste"),"no")
	end


	test "si es amigo" do

		nuevaAmistad = Amigo.new fk_usuario1:3, fk_usuario2:4, status:"amigo",
		            fecha:"12-12-12", leido:"no"
     	nuevaAmistad.new_record?
		nuevaAmistad.save

		new_user = User.new()
		a = new_user.verificarAmistad(3,"luz@hotmail.com")
		b = new_user.verificarAmistad(4,"jdanielm90@hotmail.com")

		assert_equal(a,b)

	end

	test "si aun no es amigo" do

		nuevaAmistad = Amigo.new fk_usuario1:3, fk_usuario2:4, status:"pendiente",
		            fecha:"12-12-12", leido:"no"
     	nuevaAmistad.new_record?
		nuevaAmistad.save

		new_user = User.new()
		a = new_user.verificarAmistad(3,"luz@hotmail.com")
		b = new_user.verificarAmistad(4,"jdanielm90@hotmail.com")

		assert_equal(a,b)		

	end

	test "si no tiene nada de relacion" do

		new_user = User.new()
		a = new_user.verificarAmistad(1,"correoquenoexiste0@hotmail.com")

		assert_equal(a,"no existe")	

	end

	test "cantidad amigos" do

		new_user = User.new()

		assert_not_nil(new_user.cantidadAmigos)
	end

	test "si es mi amigo" do

		nuevaAmistad = Amigo.new fk_usuario1:3, fk_usuario2:4, status:"amigo",
		            fecha:"12-12-12", leido:"no"
     	nuevaAmistad.new_record?
		nuevaAmistad.save		

		new_user = User.new()

		assert_not_equal(new_user.verSiEsAmigo(3,4),"no")


	end

	test "si no es mi amigo" do

		nuevaAmistad = Amigo.new fk_usuario1:3, fk_usuario2:4, status:"pendiente",
		            fecha:"12-12-12", leido:"no"
     	nuevaAmistad.new_record?
		nuevaAmistad.save		

		new_user = User.new()

		assert_equal(new_user.verSiEsAmigo(3,4),"no")

	end

	test "cantidad de mis amigos" do

		new_user = User.new()
		assert_not_nil(new_user.cantidadMisAmigos(3))

	end

	test "usuarios totales" do

		new_user = User.new()
		assert_equal(new_user.cantidadUsuarios, User.count)
	end

	test "buscar por nombre" do

		new_user = User.new()

		assert_not_nil (new_user.buscarNombre("Daniel Moros"))

	end

end
