require 'test_helper'

class UserTest < ActiveSupport::TestCase
	
	test "prueba" do
		
		new_user = User.new()
		assert_not_nil (new_user.save)
		
		#new_user2 = User.find_by(name: "LUZ")
		#assert_nil (new_user2)

		new_user.modificarNombreApellido("Daniel",1)

		new_user3 = User.find(1)

		assert_equal("Daniel",new_user3.name)
	
	end

	test "modificar" do

		new_user = User.new()
		new_user.modificarNombreApellido("Daniel",1)
		new_user2 = User.find(1)
		assert_equal("Daniel",new_user2.name)

	end
	
end
