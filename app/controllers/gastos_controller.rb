class GastosController < ApplicationController
	before_action :set_gasto, only: [:show, :edit, :update, :destroy]

  # GET /gastos
  # GET /gastos.json
  def index
    authorize Gasto
    @search = GastoSearch.new(params[:search])
    @gastos = @search.scope
    @gastos = Gasto.all
    respond_to do |format|
      format.html
      format.csv {render text: @gastos.to_csv }
    end
  end

  # GET /gastos/1
  # GET /gastos/1.json                                                                                            
  def show
    @gastos = Gasto.all
    authorize @gasto
  end

  # GET /gastos/new
  def new
    @gasto =   Gasto.new   
    authorize @gasto                                                                 
  end

  # GET /gastos/1/edit
  def edit
    authorize @gasto
  end

  # POST /gastos
  # POST /gastos.json
  def create
    @gasto = Gasto.new(gasto_params)
    authorize @gasto
    respond_to do |format|
      if @gasto.save
        format.html { redirect_to @gasto, notice: 'Gasto was successfully created.' }
        format.json { render :show, status: :created, location: @gasto }
      else
        format.html { render :new }
        format.json { render json: @gasto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gastos/1
  # PATCH/PUT /gastos/1.json
  def update
    respond_to do |format|
      authorize @gasto
      if @gasto.update(gasto_params)
        format.html { redirect_to @gasto, notice: 'Gasto was successfully updated.' }
        format.json { render :show, status: :ok, location: @gasto }
      else
        format.html { render :edit }
        format.json { render json: @gasto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gastos/1
  # DELETE /gastos/1.json
  def destroy
    @gasto.destroy
    authorize @gasto
    respond_to do |format|
      format.html { redirect_to gastos_url, notice: 'Gasto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    Gasto.import(params[:file])
    authorize @gasto
    redirect_to gastos_path, notice: 'Datos subidos.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gasto
      @gasto = Gasto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gasto_params
      params.require(:gasto).permit(:fecha_recepcion, :fecha_de_vencimiento, :proveedore_id, :gasto_id, :importe, :iva, :asignar_a_cliente, :cliente_id, :subcuenta_puc_id, :compra_de_activo, :pago)
    end
end
