class ActivoFijosController < ApplicationController
	before_action :set_activo_fijo, only: [:show, :edit, :update, :destroy]

  # GET /activo_fijos
  # GET /activo_fijos.json
  def index
    @activo_fijos = ActivoFijo.all
  end

  # GET /activo_fijos/1
  # GET /activo_fijos/1.json                                                                                            
  def show
    @activo_fijos = ActivoFijo.all
  end

  # GET /activo_fijos/new
  def new
    @activo_fijo =   ActivoFijo.new                                                                     
  end

  # GET /activo_fijos/1/edit
  def edit
  end

  # POST /activo_fijos
  # POST /activo_fijos.json
  def create
    @activo_fijo = ActivoFijo.new(activo_fijo_params)

    respond_to do |format|
      if @activo_fijo.save
        format.html { redirect_to @activo_fijo, notice: 'ActivoFijo was successfully created.' }
        format.json { render :show, status: :created, location: @activo_fijo }
      else
        format.html { render :new }
        format.json { render json: @activo_fijo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activo_fijos/1
  # PATCH/PUT /activo_fijos/1.json
  def update
    respond_to do |format|
      if @activo_fijo.update(activo_fijo_params)
        format.html { redirect_to @activo_fijo, notice: 'ActivoFijo was successfully updated.' }
        format.json { render :show, status: :ok, location: @activo_fijo }
      else
        format.html { render :edit }
        format.json { render json: @activo_fijo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activo_fijos/1
  # DELETE /activo_fijos/1.json
  def destroy
    @activo_fijo.destroy
    respond_to do |format|
      format.html { redirect_to activo_fijos_url, notice: 'ActivoFijo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activo_fijo
      @activo_fijo = ActivoFijo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activo_fijo_params
      params.require(:activo_fijo).permit(:fecha_de_compra, :gasto_id, :importe, :vida_util, :depreciacion, :descripcion)
    end
end
