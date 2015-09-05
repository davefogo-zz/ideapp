class Ajustes::TransaccionsController < ApplicationController
  before_action :set_transaccion, only: [:show, :edit, :update, :destroy]
  
  def index
    @search = TransaccionSearch.new(params[:search])
    authorize Transaccion
    @transaccions = @search.scope
    @transaccion = Transaccion.all
  end

  # GET /transaccions/1
  # GET /transaccion_params/1.json
  def show
    authorize @transaccion
  end

  def new
    @ajuste = Ajuste.find(params[:ajuste_id])
    authorize @transaccion
    @transaccion = Transaccion.new
  end

  def edit
    authorize @transaccion
  end

  def create
    @ajuste = Ajuste.find(params[:ajuste_id])
    authorize @transaccion
    @transaccion = Transaccion.new(transaccion_params)
    @transaccion.ajuste = @ajuste

    respond_to do |format|
      if @transaccion.save
        format.html { redirect_to @ajuste, notice: 'Transaccion creada.' }
        format.json { render :show, status: :created, location: @ajuste }
      else
        format.html { render :new }
        format.json { render json: @ajuste.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      authorize @transaccion
      if @transaccion.update(transaccion_params)
        format.html { redirect_to @transaccion, notice: 'Transaccion actualizada.' }
        format.json { render :show, status: :ok, location: @transaccion }
      else
        format.html { render :edit }
        format.json { render json: @transaccion.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
      @transaccion.destroy
      authorize @transaccion
      respond_to do |format|
        format.html { redirect_to transaccions_url, notice: 'Transaccion eliminada.' }
        format.json { head :no_content }
      end
  end

  private
    def set_transaccion
        @transaccion = Transaccion.find(params[:id])
    end

  	def transaccion_params
  		params.require(:transaccion).permit(:fecha, :credito, :debito, :iva, :subuenta_puc_id, :factura_item_id, :factura_proveedor_id, :gasto_id, :recibo_de_caja_id, :nit, :cliente_id, :ajuste_id)
  	end
end
