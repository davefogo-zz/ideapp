class OrdenAnuladasController < ApplicationController
  before_action :set_orden_anulada, only: [:show, :edit, :update, :destroy]

  # GET /orden_anuladas
  # GET /orden_anuladas.json
  def index
    authorize Orden
    @orden_anuladas = OrdenAnulada.all
    respond_to do |format|
      format.html
      format.csv {render text: @ajustes.to_csv }
    end
    
    if params[:search] 
      @orden_anuladas = OrdenAnulada.search(params[:search])
    else
      @orden_anuladas = OrdenAnulada.all
    end
  end

  # GET /orden_anuladas/1
  # GET /orden_anuladas/1.json
  def show
    authorize @orden
  end

  # GET /orden_anuladas/new
  def new
    @orden_anulada = OrdenAnulada.new
    authorize @orden
  end

  # GET /orden_anuladas/1/edit
  def edit
    authorize @orden
  end

  # POST /orden_anuladas
  # POST /orden_anuladas.json
  def create
    @orden_anulada = OrdenAnulada.new(orden_anulada_params)
    authorize @orden
    respond_to do |format|
      if @orden_anulada.save
        format.html { redirect_to @orden_anulada, notice: 'OrdenAnulada creado.' }
        format.json { render :show, status: :created, location: @orden_anulada }
      else
        format.html { render :new }
        format.json { render json: @orden_anulada.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orden_anuladas/1
  # PATCH/PUT /orden_anuladas/1.json
  def update
    respond_to do |format|
      authorize @orden
      if @orden_anulada.update(orden_anulada_params)
        format.html { redirect_to @orden_anulada, notice: 'OrdenAnulada actualizado.' }
        format.json { render :show, status: :ok, location: @orden_anulada }
      else
        format.html { render :edit }
        format.json { render json: @orden_anulada.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orden_anuladas/1
  # DELETE /orden_anuladas/1.json
  def destroy
    @orden_anulada.destroy
    authorize @orden
    respond_to do |format|
      format.html { redirect_to orden_anuladas_url, notice: 'OrdenAnulada eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orden_anulada
      @orden_anulada = OrdenAnulada.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orden_anulada_params
      params.require(:orden_anulada).permit(:fecha_orden, :orden_reemplazada, :unidad, :costo_unidad, :presupuesto, :cantidad, :iva, :total)
    end 
end      