class AjustesController < ApplicationController
  before_action :set_ajuste, only: [:show, :edit, :update, :destroy]
  # GET /ajustes
  # GET /ajustes.json
  def index
     @ajustes = Ajuste.all
     authorize Ajuste
     respond_to do |format|
      format.html
      format.csv {render text: @ajustes.to_csv }
    end

    #@search = AjusteSearch.new(params[:search])
    #@ajustes = @search.scope
  end

  # GET /ajustes/1
  # GET /ajustes/1.json
  def show
    @ajuste = Ajuste.find(params[:id])
    @transaccions = @ajuste.transaccions
    authorize @ajuste
    respond_to do |format|
      format.html
      format.pdf do
        pdf = AjustePdf.new(@ajuste, view_context)
        send_data pdf.render, filename: 'ajuste_#{@ajuste.id}.pdf',
                             type: 'application/pdf',
                              disposition: 'inline'
      end
    end
  end

  # GET /ajustes/new
  def new
   @ajuste = Ajuste.new
   authorize @ajuste
  end
  
  # GET /ajustes/1/edit
  def edit
    @ajuste = Ajuste.find(params[:id])
    authorize @ajuste
  end

  # POST /ajustes
  # POST /ajustes.json
  def create
    @ajuste = Ajuste.new(ajuste_params)
    authorize @ajuste

    respond_to do |format|
      if @ajuste.save
        format.html { redirect_to @ajuste, notice: 'Ajuste creado.' }
        format.json { render :show, status: :created, location: @ajuste }
      else
        format.html { render :new }
        format.json { render json: @ajuste.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ajustes/1
  # PATCH/PUT /ajustes/1.json
  def update
    @ajuste = Ajuste.find(params[:id])
    authorize @ajuste
    respond_to do |format|
      if @ajuste.update(ajuste_params)
        format.html { redirect_to @ajuste, notice: 'Ajuste actualizada.' }
        format.json { render :show, status: :ok, location: @ajuste }
      else
        format.html { render :edit }
        format.json { render json: @ajuste.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ajustes/1
  # DELETE /ajustes/1.json
  def destroy
    @ajuste.destroy
    #authorize @ajuste
    respond_to do |format|
      format.html { redirect_to ajustes_url, notice: 'Ajuste eliminado.' }
      format.json { head :no_content }
    end
  end

  def total
    @search = TotalSearch.new(params[:search])
    @transaccions = @search.scope
    @ajustes = Ajuste.all

    respond_to do |format|
      format.html
      format.csv {render text: @transaccions.to_csv }
    end
  end

  def import
    Ajuste.import(params[:file])
    authorize @ajuste
    redirect_to ajustes_path, notice: 'Datos subidos.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ajuste
      @ajuste = Ajuste.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ajuste_params
      params.require(:ajuste).permit(:fecha, :cliente_id, :proveedore_id, :descripcion)
    end
end
