class ReciboDeCajasController < ApplicationController
	before_action :set_recibo_de_caja, only: [:show, :edit, :update, :destroy]

  # GET /recibo_de_cajas
  # GET /recibo_de_cajas.json
  def index
    @search = ReciboDeCajaSearch.new(params[:search])
    @recibo_de_cajas = @search.scope
  end

  # GET /recibo_de_cajas/1
  # GET /recibo_de_cajas/1.json                                                                                            
  def show
    @recibo_de_cajas = ReciboDeCaja.all
  end

  # GET /recibo_de_cajas/new
  def new
    @recibo_de_caja =   ReciboDeCaja.new                                                                     
  end

  # GET /recibo_de_cajas/1/edit
  def edit
  end

  # POST /recibo_de_cajas
  # POST /recibo_de_cajas.json
  def create
    @recibo_de_caja = ReciboDeCaja.new(recibo_de_caja_params)

    respond_to do |format|
      if @recibo_de_caja.save
        format.html { redirect_to @recibo_de_caja, notice: 'Recibo de Caja Creado.' }
        format.json { render :show, status: :created, location: @recibo_de_caja }
      else
        format.html { render :new }
        format.json { render json: @recibo_de_caja.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recibo_de_cajas/1
  # PATCH/PUT /recibo_de_cajas/1.json
  def update
    respond_to do |format|
      if @recibo_de_caja.update(recibo_de_caja_params)
        format.html { redirect_to @recibo_de_caja, notice: 'Recibo de Caja was successfully updated.' }
        format.json { render :show, status: :ok, location: @recibo_de_caja }
      else
        format.html { render :edit }
        format.json { render json: @recibo_de_caja.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recibo_de_cajas/1
  # DELETE /recibo_de_cajas/1.json
  def destroy
    @recibo_de_caja.destroy
    respond_to do |format|
      format.html { redirect_to recibo_de_cajas_url, notice: 'Recibo de Caja eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recibo_de_caja
      @recibo_de_caja = ReciboDeCaja.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recibo_de_caja_params
      params.require(:recibo_de_caja).permit(:fecha, :factura_id, :importe, :concepto, :forma_de_pago, :numero_de_cheque, :numero_de_cuenta, :codigo_de_banco, :subcuenta_puc_id)
    end
end