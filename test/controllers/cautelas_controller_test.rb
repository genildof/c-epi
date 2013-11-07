require 'test_helper'

class CautelasControllerTest < ActionController::TestCase
  setup do
    @cautela = cautelas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cautelas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cautela" do
    assert_difference('Cautela.count') do
      post :create, cautela: {anexo: @cautela.anexo, colaborador_id: @cautela.colaborador_id, comentarios: @cautela.comentarios, data: @cautela.data, operador_id: @cautela.operador_id, status: @cautela.status}
    end

    assert_redirected_to cautela_path(assigns(:cautela))
  end

  test "should show cautela" do
    get :show, id: @cautela
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cautela
    assert_response :success
  end

  test "should update cautela" do
    patch :update, id: @cautela, cautela: {anexo: @cautela.anexo, colaborador_id: @cautela.colaborador_id, comentarios: @cautela.comentarios, data: @cautela.data, operador_id: @cautela.operador_id, status: @cautela.status}
    assert_redirected_to cautela_path(assigns(:cautela))
  end

  test "should destroy cautela" do
    assert_difference('Cautela.count', -1) do
      delete :destroy, id: @cautela
    end

    assert_redirected_to cautelas_path
  end
end
