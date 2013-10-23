require 'test_helper'

class GuardarDatosControllerTest < ActionController::TestCase
  test "should get guardarDatos" do
    get :guardarDatos
    assert_response :success
  end

end
