require 'test_helper'

class ColaboradorsControllerTest < ActionController::TestCase
  setup do
    @colaborador = colaboradors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:colaboradors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create colaborador" do
    assert_difference('Colaborador.count') do
      post :create, colaborador: { admissao: @colaborador.admissao, cargo_id: @colaborador.cargo_id, cidade_id: @colaborador.cidade_id, desligamento: @colaborador.desligamento, matricula: @colaborador.matricula, nome: @colaborador.nome }
    end

    assert_redirected_to colaborador_path(assigns(:colaborador))
  end

  test "should show colaborador" do
    get :show, id: @colaborador
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @colaborador
    assert_response :success
  end

  test "should update colaborador" do
    patch :update, id: @colaborador, colaborador: { admissao: @colaborador.admissao, cargo_id: @colaborador.cargo_id, cidade_id: @colaborador.cidade_id, desligamento: @colaborador.desligamento, matricula: @colaborador.matricula, nome: @colaborador.nome }
    assert_redirected_to colaborador_path(assigns(:colaborador))
  end

  test "should destroy colaborador" do
    assert_difference('Colaborador.count', -1) do
      delete :destroy, id: @colaborador
    end

    assert_redirected_to colaboradors_path
  end
end
