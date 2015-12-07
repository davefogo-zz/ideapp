class PresupuestosController < ApplicationController
  before_action :set_presupuesto, only: [:show, :edit, :update, :destroy]

  # GET /presupuestos
  # GET /presupuestos.json
  def index
    @search = PresupuestoSearch.new(params[:search])
    authorize Presupuesto
    @presupuestos = @search.scope
    @presupuestos = Presupuesto.all

    respond_to do |format|
      format.html
      format.csv {render text: @presupuestos.to_csv }
    end

  end

  # GET /presupuestos/1
  # GET /presupuestos/1.json
  def show
    @presupuesto = Presupuesto.find(params[:id])
    authorize @presupuesto
    @ordenes = @presupuesto.ordenes
    respond_to do |format|
      format.html
      format.pdf do
        pdf = PresupuestoPdf.new(@presupuesto, view_context)
        send_data pdf.render, filename: 'orden_#{@presupuesto.id}.pdf',
                              type: 'application/pdf',
                              disposition: 'inline'
      end
    end
  end

  # GET /presupuestos/new
  def new
    @presupuesto = Presupuesto.new
    authorize @presupuesto
  end

  # GET /presupuestos/1/edit
  def edit
    authorize @presupuesto
  end

  # POST /presupuestos
  # POST /presupuestos.json
  def create
    @presupuesto = Presupuesto.new(presupuesto_params)
    authorize @presupuesto
    respond_to do |format|
      if @presupuesto.save
        format.html { redirect_to @presupuesto, notice: 'Presupuesto creado.' }
        format.json { render :show, status: :created, location: @presupuesto }
      else
        format.html { render :new }
        format.json { render json: @presupuesto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /presupuestos/1
  # PATCH/PUT /presupuestos/1.json
  def update
    respond_to do |format|
      authorize @presupuesto
      if @presupuesto.update(presupuesto_params)
        format.html { redirect_to @presupuesto, notice: 'Presupuesto actualizado.' }
        format.json { render :show, status: :ok, location: @presupuesto }
      else
        format.html { render :edit }
        format.json { render json: @presupuesto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /presupuestos/1
  # DELETE /presupuestos/1.json
  def destroy
    @presupuesto.destroy
    authorize @presupuesto
    respond_to do |format|
      format.html { redirect_to presupuestos_url, notice: 'Presupuesto eliminado.' }
      format.json { head :no_content }
    end
  end

  def import
    Presupuesto.import(params[:file])
    authorize @presupuesto
    redirect_to presupuestos_path, notice: 'Datos subidos.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_presupuesto
      @presupuesto = Presupuesto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def presupuesto_params
      params.require(:presupuesto).permit(:fecha, :titulo, :producto, :cliente_id, :tipo_de_medio, :subtotal, :iva, :total)
    end
end
