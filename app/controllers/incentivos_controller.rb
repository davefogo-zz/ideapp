class IncentivosController < ApplicationController
before_action :set_incentivo, only: [:show, :edit, :update, :destroy]

  def index
    #respond_to do |format|
      #format.html
      #format.csv {render text: @incentivo.to_csv }
    #end
  	@search = IncentivoSearch.new(params[:search])
    @incentivo = @search.scope
    @incentivo = Incentivo.all
    authorize Incentivo

  end

  def show 
    authorize @incentivo
  end

  def new
  	@incentivo = Incentivo.new
    authorize @incentivo
  end

   def edit
    authorize @incentivo
  end

  def create
		@incentivo = Incentivo.new(incentivo_params)
		authorize @incentivo
		respond_to do |format|
	    if @incentivo.save
	    	redirect_to @incentivo	
	    else 
	    	render :action => "new"
	    end
    end
	end

  def update
    respond_to do |format|
      authorize @incentivo
      if @incentivo.update(incentivo_params)
        format.html { redirect_to @incentivo, notice: 'Incentivo actualizado.' }
        format.json { render :show, status: :ok, location: @incentivo }
      else
        format.html { render :edit }
        format.json { render json: @incentivo.errors, status: :unprocessable_entity }
      end
    end
  end
  #def import
   # Volumen.import(params[:file])
   # redirect_to incentivo_path, notice: 'Datos subidos.'
  #end

  private

  def set_incentivo
      @incentivo = Incentivo.find(params[:id])
    end

	def incentivo_params
		params.require(:incentivo).permit(:tipo_de_volumen , :valor_incentivo, :medio_id, :ordene_id, :rango, :escala, :pago_id)
	end
end
