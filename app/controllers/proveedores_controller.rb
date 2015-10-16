class ProveedoresController < ApplicationController
  before_action :set_proveedore, only: [:show, :edit, :update, :destroy]

  # GET /proveedores
  # GET /proveedores.json
  def index
    authorize Proveedore
    if params[:search] 
      @proveedores = Proveedore.search(params[:search])
    else
      @proveedores = Proveedore.all
    end
    respond_to do |format|
      format.html
      format.csv {render text: @proveedores.to_csv }
    end
  end

  # GET /proveedores/1
  # GET /proveedores/1.json
  def show
    authorize @proveedore
  end

  # GET /proveedores/new
  def new
    @proveedore = Proveedore.new
    authorize @proveedore
  end

  # GET /proveedores/1/edit
  def edit
    authorize @proveedore
  end

  # POST /proveedores
  # POST /proveedores.json
  def create
    @proveedore = Proveedore.new(proveedore_params)
    authorize @proveedore
    respond_to do |format|
      if @proveedore.save
        format.html { redirect_to @proveedore, notice: 'Proveedor creado.' }
        format.json { render :show, status: :created, location: @proveedore }
      else
        format.html { render :new }
        format.json { render json: @proveedore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proveedores/1
  # PATCH/PUT /proveedores/1.json
  def update
    respond_to do |format|
      authorize @proveedore
      if @proveedore.update(proveedore_params)
        format.html { redirect_to @proveedore, notice: 'Proveedor actualizado.' }
        format.json { render :show, status: :ok, location: @proveedore }
      else
        format.html { render :edit }
        format.json { render json: @proveedore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proveedores/1
  # DELETE /proveedores/1.json
  def destroy
    @proveedore.destroy
    authorize @proveedore
    respond_to do |format|
      format.html { redirect_to proveedores_url, notice: 'Proveedor eliminado.' }
      format.json { head :no_content }
    end
  end

  def import
    Proveedore.import(params[:file])
    authorize Proveedore
    redirect_to proveedores_path, notice: 'Datos subidos.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proveedore
      @proveedore = Proveedore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proveedore_params
      params.require(:proveedore).permit(:nombre, :direccion, :telefono, :contacto_financiero, :contacto_comercial, :pronto_pago, :dias_pronto_pago, :tipo_de_documento, :tipo_de_responsable, :tipo_de_persona, :tipo_de_retencion_iva, :tipo_de_retencion_ica, :numero_de_documento)
    end
end
