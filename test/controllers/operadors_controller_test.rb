require 'test_helper'

class OperadorsControllerTest < ActionController::TestCase
  setup do
    @operador = operadors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create operador" do
    assert_difference('Operador.count') do
      post :create, operador: { cidade_id: @operador.cidade_id, login: @operador.login, nome: @operador.nome, password: @operador.password, perfil: @operador.perfil }
    end

    assert_redirected_to operador_path(assigns(:operador))
  end

  test "should show operador" do
    get :show, id: @operador
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @operador
    assert_response :success
  end

  test "should update operador" do
    patch :update, id: @operador, operador: { cidade_id: @operador.cidade_id, login: @operador.login, nome: @operador.nome, password: @operador.password, perfil: @operador.perfil }
    assert_redirected_to operador_path(assigns(:operador))
  end

  test "should destroy operador" do
    assert_difference('Operador.count', -1) do
      delete :destroy, id: @operador
    end

    assert_redirected_to operadors_path
  end
end
