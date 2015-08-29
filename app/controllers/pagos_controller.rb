class PagosController < ApplicationController
	before_action :set_pago, only: [:show, :edit, :update, :destroy]

  # GET /pagos
  # GET /pagos.json
  def index
    @search = PagoSearch.new(params[:search])
    @pagos = @search.scope
  end

  # GET /pagos/1
  # GET /pagos/1.json                                                                                            
  def show
    @pagos = Pago.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = PagoPdf.new(@pago, view_context)
        send_data pdf.render, filename: 'orden_de_pago#{@orden.id}.pdf',
                              type: 'application/pdf',
                              disposition: 'inline'
      end
    end
  end

  # GET /pagos/new
  def new
    @pago =  Pago.new                                                                     
  end

  # GET /pagos/1/edit
  def edit
  end

  # POST /pagos
  # POST /pagos.json
  def create
    @pago = Pago.new(pago_params)

    respond_to do |format|
      if @pago.save
        format.html { redirect_to @pago, notice: 'Orden de Pago creada.' }
        format.json { render :show, status: :created, location: @pago }
      else
        format.html { render :new }
        format.json { render json: @pago.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pagos/1
  # PATCH/PUT /pagos/1.json
  def update
    respond_to do |format|
      if @pago.update(pago_params)
        format.html { redirect_to @pago, notice: 'Orden de Pago Pagada.' }
        format.json { render :show, status: :ok, location: @pago }
      else
        format.html { render :edit }
        format.json { render json: @pago.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pagos/1
  # DELETE /pagos/1.json
  def destroy
    @pago.destroy
    respond_to do |format|
      format.html { redirect_to pagos_url, notice: 'Pago was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pago
      @pago = Pago.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pago_params
      params.require(:pago).permit(:fecha,:proveedore_id, :factura_proveedor_id, :importe, :forma_de_pago, :gasto, :subcuenta_puc_id, :banco, :pagar, :importe_pronto_pago, :total)
    end
end
