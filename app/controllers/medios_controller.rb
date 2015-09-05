class MediosController < ApplicationController
  before_action :set_medio, only: [:show, :edit, :update, :destroy]

  # GET /medios
  # GET /medios.json
  def index
    @medio = Medio.all
    authorize Medio
    respond_to do |format|
      format.html
      format.csv {render text: @ajustes.to_csv }
    end
    
    if params[:search] 
      @medios = Medio.search(params[:search])
    else
      @medios = Medio.all
    end
  end

  # GET /medios/1
  # GET /medios/1.json
  def show
    authorize @medio
  end

  # GET /medios/new
  def new
    @medio = Medio.new
    authorize @medio
  end

  # GET /medios/1/edit
  def edit
    authorize @medio
  end

  # POST /medios
  # POST /medios.json
  def create
    @medio = Medio.new(medio_params)
    authorize @medio
    respond_to do |format|
      if @medio.save
        format.html { redirect_to @medio, notice: 'Medio creado.' }
        format.json { render :show, status: :created, location: @medio }
      else
        format.html { render :new }
        format.json { render json: @medio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medios/1
  # PATCH/PUT /medios/1.json
  def update
    respond_to do |format|
      authorize @medio
      if @medio.update(medio_params)
        format.html { redirect_to @medio, notice: 'Medio actualizado.' }
        format.json { render :show, status: :ok, location: @medio }
      else
        format.html { render :edit }
        format.json { render json: @medio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medios/1
  # DELETE /medios/1.json
  def destroy
    @medio.destroy
    authorize @medio
    respond_to do |format|
      format.html { redirect_to medios_url, notice: 'Medio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    Ajuste.import(params[:file])
    authorize @medio
    redirect_to ajustes_path, notice: 'Datos subidos.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medio
      @medio = Medio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medio_params
      params.require(:medio).permit(:nombre, :nit, :direccion, :telefono, :contacto_financiero, :contacto_comercial, :proveedore_id, :tipo_de_volumen, :escala, :rango, :escala2, :rango2, :escala3, :rango3, :escala4, :rango4, :escala5, :rango5, :escala6, :rango6 , :cobro)
    end
end
