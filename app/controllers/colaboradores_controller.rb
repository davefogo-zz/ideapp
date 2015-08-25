class ColaboradoresController < ApplicationController
  before_action :set_colaboradore, only: [:show, :edit, :update, :destroy]

  # GET /colaboradores
  # GET /colaboradores.json
  def index
    @colaboradores = Colaboradore.all
    if params[:search] 
      @colaboradores = Colaboradore.search(params[:search])
    else
      @colaboradores = Colaboradore.all
    end
    authorize Colaboradore
  end

  # GET /colaboradores/1
  # GET /colaboradores/1.json
  def show
    @users = User.all
    authorize @colaboradore
  end

  # GET /colaboradores/new
  def new
    @colaboradore = Colaboradore.new
    authorize @colaboradore
  end

  # GET /colaboradores/1/edit
  def edit
  end

  # POST /colaboradores
  # POST /colaboradores.json
  def create
    @colaboradore = Colaboradore.new(colaboradore_params)
    authorize @colaboradore

    respond_to do |format|
      if @colaboradore.save
        format.html { redirect_to @colaboradore, notice: 'Colaborador creado.' }
        format.json { render :show, status: :created, location: @colaboradore }
      else
        format.html { render :new }
        format.json { render json: @colaboradore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /colaboradores/1
  # PATCH/PUT /colaboradores/1.json
  def update
    authorize @colaboradore
    respond_to do |format|
      if @colaboradore.update(colaboradore_params)
        format.html { redirect_to @colaboradore, notice: 'Colaborador actualizado.' }
        format.json { render :show, status: :ok, location: @colaboradore }
      else
        format.html { render :edit }
        format.json { render json: @colaboradore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /colaboradores/1
  # DELETE /colaboradores/1.json
  def destroy
    authorize @colaboradore
    @colaboradore.destroy
    respond_to do |format|
      format.html { redirect_to colaboradores_url, notice: 'Colaborador eliminado.' }
      format.json { head :no_content }
    end
  end

  def import
    Colaboradore.import(params[:file])
    redirect_to colaboradores_path, notice: 'Datos subidos.'
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_colaboradore
      @colaboradore = Colaboradore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def colaboradore_params
      params.require(:colaboradore).permit(:nombre, :user_id, :first_name, :last_name, :name, :cedula, :direccion, :telefono_personal, :telefono_empresa, :cargo_id, :departamento_id, :jefe_inmediato)
    end
end
