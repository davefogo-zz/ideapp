class ProveedoresController < ApplicationController
  before_action :set_proveedore, only: [:show, :edit, :update, :destroy]

  # GET /proveedores
  # GET /proveedores.json
  def index
    @proveedores = Proveedore.all

    respond_to do |format|
      format.html
      format.csv {render text: @proveedores.to_csv }
    end

    if params[:search] 
      @proveedores = Proveedore.search(params[:search])
    else
      @proveedores = Proveedore.all
    end
  end

  # GET /proveedores/1
  # GET /proveedores/1.json
  def show
  end

  # GET /proveedores/new
  def new
    @proveedore = Proveedore.new
  end

  # GET /proveedores/1/edit
  def edit
  end

  # POST /proveedores
  # POST /proveedores.json
  def create
    @proveedore = Proveedore.new(proveedore_params)

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
    respond_to do |format|
      format.html { redirect_to proveedores_url, notice: 'Proveedor eliminado.' }
      format.json { head :no_content }
    end
  end

  def import
    Proveedore.import(params[:file])
    redirect_to proveedores_path, notice: 'Datos subidos.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proveedore
      @proveedore = Proveedore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proveedore_params
      params.require(:proveedore).permit(:nombre, :nit, :direccion, :telefono, :contacto_financiero, :contacto_comercial, :pronto_pago, :dias_pronto_pago)
    end
end
