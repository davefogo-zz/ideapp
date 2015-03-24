require 'test_helper'

class OrdenesControllerTest < ActionController::TestCase
  setup do
    @ordene = ordenes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ordenes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ordene" do
    assert_difference('Ordene.count') do
      post :create, ordene: { costo_unidad: @ordene.costo_unidad, fecha_orden: @ordene.fecha_orden, medida: @ordene.medida, presupuesto_id: @ordene.presupuesto_id, total: @ordene.total, unidad: @ordene.unidad }
    end

    assert_redirected_to ordene_path(assigns(:ordene))
  end

  test "should show ordene" do
    get :show, id: @ordene
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ordene
    assert_response :success
  end

  test "should update ordene" do
    patch :update, id: @ordene, ordene: { costo_unidad: @ordene.costo_unidad, fecha_orden: @ordene.fecha_orden, medida: @ordene.medida, presupuesto_id: @ordene.presupuesto_id, total: @ordene.total, unidad: @ordene.unidad }
    assert_redirected_to ordene_path(assigns(:ordene))
  end

  test "should destroy ordene" do
    assert_difference('Ordene.count', -1) do
      delete :destroy, id: @ordene
    end

    assert_redirected_to ordenes_path
  end
end
