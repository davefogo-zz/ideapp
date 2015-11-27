class Presupuestos::Ordenes::OrdenItemsController < ApplicationController
  # GET /ordenes
  # GET /ordenes.json
  def index
    @orden_items = OrdenItem.all
    authorize Ordene
  end

  # GET /ordenes/1
  # GET /ordenes/1.json
  def show
    @presupuesto = Presupuesto.find(params[:presupuesto_id])
    @ordene = Ordene.find(params[:ordene_id])
    authorize OrdenItem
    @orden_item = OrdenItem.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  # GET /ordenes/new
  def new
    @presupuesto = Presupuesto.find(params[:presupuesto_id])
    @ordene = Ordene.find(params[:ordene_id])
    authorize @ordene
    @orden_item = OrdenItem.new
  end

  # GET /ordenes/1/edit
  def edit
    @presupuesto = Presupuesto.find(params[:presupuesto_id])
    @ordene = Ordene.find(params[:ordene_id])
    authorize @ordene
    @orden_item = OrdenItem.find(params[:id]) 
  end

  # POST /ordenes
  # POST /ordenes.json
  def create
    @presupuesto = Presupuesto.find(params[:presupuesto_id])
    @ordene = Ordene.find(params[:ordene_id])
    authorize @ordene
    @orden_item = OrdenItem.new(ordene_params)
    @orden_item.presupuesto = @presupuesto

    respond_to do |format|
      if @orden_item.save
        format.html { redirect_to @ordene, notice: 'Item de Orden creado.' }
        format.json { render :show, status: :created, location: @ordene }
      else
        format.html { render :new }
        format.json { render json: @ordene.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ordenes/1
  # PATCH/PUT /ordenes/1.json
  def update
    @presupuesto = Presupuesto.find(params[:presupuesto_id])
    @ordene = Ordene.find(params[:ordene_id])
    authorize @ordene
     @orden_item = OrdenItem.find(params[:id])
    respond_to do |format|
      if @orden_item.update(ordene_params)
        format.html { redirect_to presupuesto_path(@ordene), notice: 'Item de Orden actualizado.' }
        format.json { render :show, status: :ok, location: @orden_item }
      else
        format.html { render :edit }
        format.json { render json: @orden_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ordenes/1
  # DELETE /ordenes/1.json
  def destroy
    @presupuesto = Presupuesto.find(params[:presupuesto_id])
    @ordene = Ordene.find(params[:ordene_id])
    authorize @ordene
    @orden_item = OrdenItem.find(params[:id])
    @orden_item.destroy
    respond_to do |format|
      format.html { redirect_to presupuesto_url, notice: 'Orden eliminada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ordene
      @orden_item = OrdenItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ordene_params
      params.require(:orden_item).permit(:fecha_orden, :medida, :costo_unidad, :total, :ordene_id, :medio_id, :aprobado_por_cliente, :factura_id, :cantidad, :cobertura, :col, :cm, :descuento, :referencia_preventa, :notas, :ubicacion, :formato, :franja, :incentivo, :color, :importe_descuento, :area)
    end
end
