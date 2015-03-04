class OrdenesController < ApplicationController
  before_action :set_ordene, only: [:show, :edit, :update, :destroy]

  # GET /ordenes
  # GET /ordenes.json
  def index
    @ordenes = Ordene.all
  end

  # GET /ordenes/1
  # GET /ordenes/1.json
  def show
  end

  # GET /ordenes/new
  def new
    @ordene = Ordene.new
  end

  # GET /ordenes/1/edit
  def edit
  end

  # POST /ordenes
  # POST /ordenes.json
  def create
    @ordene = Ordene.new(ordene_params)

    respond_to do |format|
      if @ordene.save
        format.html { redirect_to @ordene, notice: 'Ordene was successfully created.' }
        format.json { render :show, status: :created, location: @ordene }
      else
        format.html { render :new }
        format.json { render json: @ordene.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ordenes/1
  # PATCH/PUT /ordenes/1.json
  def update
    respond_to do |format|
      if @ordene.update(ordene_params)
        format.html { redirect_to @ordene, notice: 'Ordene was successfully updated.' }
        format.json { render :show, status: :ok, location: @ordene }
      else
        format.html { render :edit }
        format.json { render json: @ordene.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ordenes/1
  # DELETE /ordenes/1.json
  def destroy
    @ordene.destroy
    respond_to do |format|
      format.html { redirect_to ordenes_url, notice: 'Ordene was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ordene
      @ordene = Ordene.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ordene_params
      params.require(:ordene).permit(:fecha_orden, :medida, :unidad, :costo_unidad, :total, :presupuesto_id)
    end
end
