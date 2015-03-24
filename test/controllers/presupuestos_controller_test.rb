require 'test_helper'

class PresupuestosControllerTest < ActionController::TestCase
  setup do
    @presupuesto = presupuestos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:presupuestos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create presupuesto" do
    assert_difference('Presupuesto.count') do
      post :create, presupuesto: { agencia: @presupuesto.agencia, cliente: @presupuesto.cliente, colaboradore_id: @presupuesto.colaboradore_id, contacto_comercial: @presupuesto.contacto_comercial, contacto_financiero: @presupuesto.contacto_financiero, dirección: @presupuesto.dirección, ejecutivo: @presupuesto.ejecutivo, fecha: @presupuesto.fecha, nit: @presupuesto.nit, nit_agencia: @presupuesto.nit_agencia, producto: @presupuesto.producto, teléfono: @presupuesto.teléfono, titulo: @presupuesto.titulo }
    end

    assert_redirected_to presupuesto_path(assigns(:presupuesto))
  end

  test "should show presupuesto" do
    get :show, id: @presupuesto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @presupuesto
    assert_response :success
  end

  test "should update presupuesto" do
    patch :update, id: @presupuesto, presupuesto: { agencia: @presupuesto.agencia, cliente: @presupuesto.cliente, colaboradore_id: @presupuesto.colaboradore_id, contacto_comercial: @presupuesto.contacto_comercial, contacto_financiero: @presupuesto.contacto_financiero, dirección: @presupuesto.dirección, ejecutivo: @presupuesto.ejecutivo, fecha: @presupuesto.fecha, nit: @presupuesto.nit, nit_agencia: @presupuesto.nit_agencia, producto: @presupuesto.producto, teléfono: @presupuesto.teléfono, titulo: @presupuesto.titulo }
    assert_redirected_to presupuesto_path(assigns(:presupuesto))
  end

  test "should destroy presupuesto" do
    assert_difference('Presupuesto.count', -1) do
      delete :destroy, id: @presupuesto
    end

    assert_redirected_to presupuestos_path
  end
end
