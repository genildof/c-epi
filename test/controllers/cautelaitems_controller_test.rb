require 'test_helper'

class CautelaitemsControllerTest < ActionController::TestCase
  setup do
    @cautelaitem = cautelaitems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cautelaitems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cautelaitem" do
    assert_difference('Cautelaitem.count') do
      post :create, cautelaitem: {cautela_id: @cautelaitem.cautela_id, material_id: @cautelaitem.material_id, quantidade: @cautelaitem.quantidade}
    end

    assert_redirected_to cautelaitem_path(assigns(:cautelaitem))
  end

  test "should show cautelaitem" do
    get :show, id: @cautelaitem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cautelaitem
    assert_response :success
  end

  test "should update cautelaitem" do
    patch :update, id: @cautelaitem, cautelaitem: {cautela_id: @cautelaitem.cautela_id, material_id: @cautelaitem.material_id, quantidade: @cautelaitem.quantidade}
    assert_redirected_to cautelaitem_path(assigns(:cautelaitem))
  end

  test "should destroy cautelaitem" do
    assert_difference('Cautelaitem.count', -1) do
      delete :destroy, id: @cautelaitem
    end

    assert_redirected_to cautelaitems_path
  end
end
