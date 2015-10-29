class ReciboDeCajas::ReciboItemsController < ApplicationController

  # GET /recibo_items
  # GET /recibo_items.json
  def index
    @search = ReciboItemSearch.new(params[:search])
    @recibo_items = @search.scope
    @recibo_items = ReciboItem.all
  end

  # GET /recibo_items/1
  # GET /recibo_items/1.json
  def show
    @recibo_de_caja = ReciboDeCaja.find(params[:id])
    @recibo_item = ReciboItem.find(params[:id])
  end

  # GET /recibo_items/new
  def new
   @recibo_de_caja = ReciboDeCaja.find(params[:recibo_de_caja_id])
   @recibo_item = ReciboItem.new

  end
  
  # GET /recibo_items/1/edit
  def edit
    @recibo_item = ReciboItem.new

  end

  # POST /recibo_items
  # POST /recibo_items.json
  def create
    @recibo_de_caja = ReciboDeCaja.find(params[:recibo_de_caja_id])
    @recibo_item = ReciboItem.new(recibo_item_params)
    @recibo_item.recibo_de_caja = @recibo_de_caja
    
    respond_to do |format|
      if @recibo_item.save
        format.html { redirect_to @recibo_de_caja, notice: 'Item de Recibo creado.' }
        format.json { render :show, status: :created, location: @recibo_de_caja }
      else
        format.html { render :new }
        format.json { render json: @recibo_de_caja.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recibo_items/1
  # PATCH/PUT /recibo_items/1.json
  def update
    @recibo_item = ReciboItem.find(params[:id])
    respond_to do |format|
      if @recibo_item.update(recibo_item_params)
        format.html { redirect_to @recibo_item, notice: 'ReciboItem actualizada.' }
        format.json { render :show, status: :ok, location: @recibo_item }
      else
        format.html { render :edit }
        format.json { render json: @recibo_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recibo_items/1
  # DELETE /recibo_items/1.json
  def destroy
    @recibo_item.destroy
    respond_to do |format|
      format.html { redirect_to recibo_items_url, notice: 'ReciboItem eliminada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recibo_item
      @recibo_item = ReciboItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recibo_item_params
      params.require(:recibo_item).permit(:recibo_de_caja_id, :factura_id, :fecha, :numero_de_cheque, :importe, :forma_de_pago, :subcuenta_puc_id, :banco )
    end
end