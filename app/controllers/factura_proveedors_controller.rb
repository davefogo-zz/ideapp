class FacturaProveedorsController < ApplicationController
  before_action :set_factura_proveedor, only: [:show, :edit, :update, :destroy]

  # GET /factura_proveedors
  # GET /factura_proveedors.json
  def index
    authorize FacturaProveedor
    @search = FacturaProveedorSearch.new(params[:search])
    @factura_proveedors = @search.scope
    @factura_proveedors = FacturaProveedor.all
     respond_to do |format|
      format.html
      format.csv {render text: @factura_proveedors.to_csv }
    end
  end

  # GET /factura_proveedors/1
  # GET /factura_proveedors/1.json                                                                                            
  def show
    @factura_proveedors = FacturaProveedor.all
    authorize @factura_proveedor
  end

  # GET /factura_proveedors/new
  def new
    @factura_proveedor =   FacturaProveedor.new   
    authorize @factura_proveedor                                                                  
  end

  # GET /factura_proveedors/1/edit
  def edit
  end

  # POST /factura_proveedors
  # POST /factura_proveedors.json
  def create
    @factura_proveedor = FacturaProveedor.new(factura_proveedor_params)
    authorize @factura_proveedor
    respond_to do |format|
      if @factura_proveedor.save
        format.html { redirect_to @factura_proveedor, notice: 'Factura de proveedor ingresada.' }
        format.json { render :show, status: :created, location: @factura_proveedor }
      else
        format.html { render :new }
        format.json { render json: @factura_proveedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /factura_proveedors/1
  # PATCH/PUT /factura_proveedors/1.json
  def update
    respond_to do |format|
      authorize @factura_proveedor
      if @factura_proveedor.update(factura_proveedor_params)
        format.html { redirect_to @factura_proveedor, notice: 'Factura de proveedor asignada a orden de pago.' }
        format.json { render :show, status: :ok, location: @factura_proveedor }
      else
        format.html { render :edit }
        format.json { render json: @factura_proveedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /factura_proveedors/1
  # DELETE /factura_proveedors/1.json
  def destroy
    @factura_proveedor.destroy
    authorize @factura_proveedor
    respond_to do |format|
      format.html { redirect_to factura_proveedors_url, notice: 'Factura proveedor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    Colaboradore.import(params[:file])
    authorize @factura_proveedor
    redirect_to factura_proveedors_path, notice: 'Datos subidos.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_factura_proveedor
      @factura_proveedor = FacturaProveedor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def factura_proveedor_params
      params.require(:factura_proveedor).permit(:fecha_recepcion, :ordene_id, :proveedore_id, :importe, :devolucion, :iva, :subcuenta_puc_id, :importe_pronto_pago, :pronto_pago, :fecha_vencimiento, :numero_de_factura, :pago_id)
    end
end
