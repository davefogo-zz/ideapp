class ContratosController < ApplicationController
  before_action :set_contrato, only: [:show, :edit, :update, :destroy]
  # GET /contratos
  # GET /contratos.json
  def index
    authorize Contrato
    @contratos = Contrato.all
    respond_to do |format|
      format.html
      format.csv {render text: @contratos.to_csv }
    end
  end

  # GET /contratos/1
  # GET /contratos/1.json
  def show
    @contrato = Contrato.find(params[:id])
    authorize @contrato
    respond_to do |format|
      format.html
    end
  end

  # GET /contratos/new
  def new
    @contrato = Contrato.new
    authorize @contrato
  end

  # GET /contratos/1/edit
  def edit
    authorize @contrato
  end

  # POST /contratos
  # POST /contratos.json
  def create
    @contrato = Contrato.new(contrato_params)
    authorize @contrato
    respond_to do |format|
      if @contrato.save
        format.html { redirect_to @contrato, notice: 'Contrato creado.' }
        format.json { render :show, status: :created, location: @contrato }
      else
        format.html { render :new }
        format.json { render json: @contrato.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contratos/1
  # PATCH/PUT /contratos/1.json
  def update
    respond_to do |format|
      authorize @contrato
      if @contrato.update(contrato_params)
        format.html { redirect_to @contrato, notice: 'Contrato actualizado.' }
        format.json { render :show, status: :ok, location: @contrato }
      else
        format.html { render :edit }
        format.json { render json: @contrato.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contratos/1
  # DELETE /contratos/1.json
  def destroy
    @contrato.destroy
    authorize @contrato 
    respond_to do |format|
      format.html { redirect_to contratos_url, notice: 'Contrato eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contrato
      @contrato = Contrato.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contrato_params
      params.require(:contrato).permit(:cliente_id, :proveedore_id, :tipo_de_medio, :iva, :total, :desde, :hasta, :descripcion, :tipo, :tipo_de_control, :tipo_de_consumo, :notas, :monto, :numero_de_contrato, :saldo)
    end
end