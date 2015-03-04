require 'test_helper'

class ClientesControllerTest < ActionController::TestCase
  setup do
    @cliente = clientes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clientes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cliente" do
    assert_difference('Cliente.count') do
      post :create, cliente: { colaboradore_id: @cliente.colaboradore_id, contacto_comercial: @cliente.contacto_comercial, contacto_facturación: @cliente.contacto_facturación, cupo_de_crédito: @cliente.cupo_de_crédito, dirección_de_facturación: @cliente.dirección_de_facturación, nit: @cliente.nit, nombre: @cliente.nombre, teléfono: @cliente.teléfono, tipo_de_cliente: @cliente.tipo_de_cliente }
    end

    assert_redirected_to cliente_path(assigns(:cliente))
  end

  test "should show cliente" do
    get :show, id: @cliente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cliente
    assert_response :success
  end

  test "should update cliente" do
    patch :update, id: @cliente, cliente: { colaboradore_id: @cliente.colaboradore_id, contacto_comercial: @cliente.contacto_comercial, contacto_facturación: @cliente.contacto_facturación, cupo_de_crédito: @cliente.cupo_de_crédito, dirección_de_facturación: @cliente.dirección_de_facturación, nit: @cliente.nit, nombre: @cliente.nombre, teléfono: @cliente.teléfono, tipo_de_cliente: @cliente.tipo_de_cliente }
    assert_redirected_to cliente_path(assigns(:cliente))
  end

  test "should destroy cliente" do
    assert_difference('Cliente.count', -1) do
      delete :destroy, id: @cliente
    end

    assert_redirected_to clientes_path
  end
end
