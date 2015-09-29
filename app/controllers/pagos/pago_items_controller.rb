class Pagos::PagoItemsController < ApplicationController

  # GET /pago_items
  # GET /pago_items.json
  def index
    @pago_item = PagoItem.all
    @pago = Pago.find(params[:pago_id])
    authorize Pago
  end

  # GET /pago_items/1
  # GET /pago_items/1.json
  def show
    @pago = Pago.find(params[:pago_id])
    authorize Pago
    @pago_item = PagoItem.find(params[:id])
  end

  # GET /pago_items/new
  def new
   @pago = Pago.find(params[:pago_id])
   authorize @pago
   @pago_item = PagoItem.new
  end
  
  # GET /pago_items/1/edit
  def edit
   @pago = Pago.find(params[:pago_id])
   authorize @pago
   @pago_item = PagoItem.find(params[:id])
  end
  # POST /pago_items
  # POST /pago_items.json
  def create
    @pago = Pago.find(params[:pago_id])
    authorize @pago
    @pago_item = PagoItem.new(pago_item_params)
    @pago_item.pago = @pago
    
    respond_to do |format|
      if @pago_item.save
        format.html { redirect_to @pago, notice: 'Item de Pago creado.' }
        format.json { render :show, status: :created, location: @pago }
      else
        format.html { render :new }
        format.json { render json: @pago.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pago_items/1
  # PATCH/PUT /pago_items/1.json
  def update
    @pago = Pago.find(params[:pago_id])
    authorize @pago
    @pago_item = PagoItem.find(params[:id])
    respond_to do |format|
      if @pago_item.update(pago_item_params)
        format.html { redirect_to @pago_item, notice: 'Item de Pago actualizado.' }
        format.json { render :show, status: :ok, location: @pago_item }
      else
        format.html { render :edit }
        format.json { render json: @pago_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pago_items/1
  # DELETE /pago_items/1.json
  def destroy
    @pago = Pago.find(params[:pago_id])
    authorize @pago
    @pago_item = PagoItem.find(params[:id])
    @pago_item.destroy
    respond_to do |format|
      format.html { redirect_to pago_items_url, notice: 'Pago Item eliminada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pago_item
      @pago_item = PagoItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pago_item_params
      params.require(:pago_item).permit(:pago_id, :factura_proveedor_id, :fecha, :numero_de_cheque, :importe, :forma_de_pago, :subcuenta_puc_id, :banco )
    end
end   