class ClientesController < ApplicationController
  before_action :set_cliente, only: [:show, :edit, :update, :destroy]

  # GET /clientes
  # GET /clientes.json
  def index
    @clientes = Cliente.all
    authorize Cliente
    respond_to do |format|
      format.html
      format.csv {render text: @colaboradores.to_csv }
    end

    if params[:search] 
      @clientes = Cliente.search(params[:search])
    else
      @clientes = Cliente.all
    end
  end

  # GET /clientes/1
  # GET /clientes/1.json
  def show
    authorize @cliente
  end

  # GET /clientes/new
  def new
    @cliente = Cliente.new
    authorize @cliente
    @user = User.all
  end

  # GET /clientes/1/edit
  def edit
    authorize @cliente
  end

  # POST /clientes
  # POST /clientes.json
  def create
    @cliente = Cliente.new(cliente_params)
    authorize @cliente
    respond_to do |format|
      if @cliente.save
        format.html { redirect_to @cliente, notice: 'Cliente creado.' }
        format.json { render :show, status: :created, location: @cliente }
      else
        format.html { render :new }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clientes/1
  # PATCH/PUT /clientes/1.json
  def update
    respond_to do |format|
      authorize @cliente
      if @cliente.update(cliente_params)
        format.html { redirect_to @cliente, notice: 'Cliente actualizado.' }
        format.json { render :show, status: :ok, location: @cliente }
      else
        format.html { render :edit }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientes/1
  # DELETE /clientes/1.json
  def destroy
    @cliente.destroy
    authorize @cliente
    respond_to do |format|
      format.html { redirect_to clientes_url, notice: 'Cliente eliminado.' }
      format.json { head :no_content }
    end
  end

   def import
    Cliente.import(params[:file])
    authorize @cliente
    redirect_to clientes_path, notice: 'Datos subidos.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = Cliente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cliente_params
      params.require(:cliente).permit(:nombre, :nit, :direccion_de_facturacion, :telefono, :tipo_de_cliente, :contacto_comercial, :contacto_facturacion, :cupo_de_credito, :colaboradore_id, :ciudad, :codigo_postal, :pais)
    end
end
