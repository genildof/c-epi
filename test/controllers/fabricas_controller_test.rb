require 'test_helper'

class FabricasControllerTest < ActionController::TestCase
  setup do
    @fabrica = fabricas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fabricas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fabrica" do
    assert_difference('Fabrica.count') do
      post :create, fabrica: {estado: @fabrica.estado, nome: @fabrica.nome}
    end

    assert_redirected_to fabrica_path(assigns(:fabrica))
  end

  test "should show fabrica" do
    get :show, id: @fabrica
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fabrica
    assert_response :success
  end

  test "should update fabrica" do
    patch :update, id: @fabrica, fabrica: {estado: @fabrica.estado, nome: @fabrica.nome}
    assert_redirected_to fabrica_path(assigns(:fabrica))
  end

  test "should destroy fabrica" do
    assert_difference('Fabrica.count', -1) do
      delete :destroy, id: @fabrica
    end

    assert_redirected_to fabricas_path
  end
end
