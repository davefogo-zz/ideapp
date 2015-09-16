class FacturaItemsController < ApplicationController
  before_action :set_factura_item, only: [:show, :edit, :update, :destroy]

  # GET /factura_items
  # GET /factura_items.json
  def index
    @search = FacturaItemSearch.new(params[:search])
    authorize FacturaItem
    @factura_items = @search.scope
    @factura_items = FacturaItem.all
  end

  # GET /factura_items/1
  # GET /factura_items/1.json                                                                                            
  def show
    @factura_items = FacturaItem.all
    authorize @factura_item
    @ordene = Ordene.all
    @medio = Medio.all
  end

  # GET /factura_items/new
  def new
    @factura_item =  FacturaItem.new  
    authorize @factura_item                                                                    
  end

  # GET /factura_items/1/edit
  def edit
  end

  # POST /factura_items
  # POST /factura_items.json
  def create
    @factura_item = FacturaItem.new(factura_item_params)
    authorize @factura_item
    @ordenes = Ordene.all
    @medio = Medio.all

    respond_to do |format|
      if @factura_item.save
        format.html { redirect_to @factura_item, notice: 'Factura item was successfully created.' }
        format.json { render :show, status: :created, location: @factura_item }
      else
        format.html { render :new }
        format.json { render json: @factura_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /factura_items/1
  # PATCH/PUT /factura_items/1.json
  def update
    authorize @factura_item
    respond_to do |format|
      if @factura_item.update(factura_item_params)
        format.html { redirect_to @factura_item, notice: 'Item de factura asociado con factura.' }
        format.json { render :show, status: :ok, location: @factura_item }
      else
        format.html { render :edit }
        format.json { render json: @factura_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /factura_items/1
  # DELETE /factura_items/1.json
  def destroy
    @factura_item.destroy
    authorize @factura_item
    respond_to do |format|
      format.html { redirect_to factura_items_url, notice: 'Factura item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_factura_item
      @factura_item = FacturaItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def factura_item_params
      params.require(:factura_item).permit(:factura_id, :ordene_id, :medio_id, :revisado, :fecha_orden, :medida, :unidad, :costo_unidad, :total, :facturar, :cantidad, :facturar_proveedor, :sin_iva, :subcuenta_puc_id)
    end
end
