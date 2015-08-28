class FacturasController < ApplicationController

  # GET /facturas
  # GET /facturas.json
  def index
    @search = FacturaSearch.new(params[:search])
    @facturas = @search.scope
    @facturas = Factura.all
  end

  # GET /facturas/1
  # GET /facturas/1.json
  def show
    @factura = Factura.find(params[:id])
    #@factura_item = FacturaItem.all
    @factura_item = FacturaItem.where("facturar" => true, factura_id: @factura.id)

    respond_to do |format|
      format.html
      format.pdf do
        pdf = FacturaPdf.new(@factura)
        send_data pdf.render, filename: 'factura_#{@factura.id}.pdf',
                              type: 'application/pdf',
                              disposition: 'inline'
      end
    end

    #@presupuesto = @factura.presupuesto
  end

  # GET /facturas/new
  def new
   @factura = Factura.new
   @presupuesto = Presupuesto.all
   @ordene = Ordene.all
   #@ordenes = Ordene.where(aprobado_por_cliente: 1) 
  end
  
  # GET /facturas/1/edit
  def edit
  end

  # POST /facturas
  # POST /facturas.json
  def create
    @factura = Factura.new(factura_params)
    

    respond_to do |format|
      if @factura.save
        format.html { redirect_to @factura, notice: 'Factura creada.' }
        format.json { render :show, status: :created, location: @factura }
      else
        format.html { render :new }
        format.json { render json: @factura.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facturas/1
  # PATCH/PUT /facturas/1.json
  def update
    respond_to do |format|
      if @factura.update(factura_params)
        format.html { redirect_to @factura, notice: 'Factura actualizada.' }
        format.json { render :show, status: :ok, location: @factura }
      else
        format.html { render :edit }
        format.json { render json: @factura.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facturas/1
  # DELETE /facturas/1.json
  def destroy
    @factura.destroy
    respond_to do |format|
      format.html { redirect_to facturas_url, notice: 'Factura eliminada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_factura
      @factura = Factura.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def factura_params
      params.require(:factura).permit(:fecha_de_expedicion, :cliente_id, :presupuesto_id )
    end
end
