class TransaccionsController < ApplicationController
  before_action :set_transaccion, only: [:show, :edit, :update, :destroy]
  def index
    @search = TransaccionSearch.new(params[:search])
    @transaccions = @search.scope
  end

  # GET /transaccions/1
  # GET /transaccion_params/1.json
  def show
  end

  def new
    @transaccion = Transaccion.new
  end

  def edit
  end

  def create
    @transaccion = Transaccion.new(transaccion_params)

    respond_to do |format|
      if @transaccion.save
        format.html { redirect_to @transaccion, notice: 'Transaccion creada.' }
        format.json { render :show, status: :created, location: @transaccion }
      else
        format.html { render :new }
        format.json { render json: @transaccion.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
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
  		params.require(:transaccion).permit(:fecha, :credito, :debito, :iva, :subuenta_puc_id, :factura_item_id, :factura_proveedor_id, :gasto_id, :recibo_de_caja_id, :nit, :cliente_id)
  	end
end
