class IncentivosController < ApplicationController
  def index
    authorize Incentivo
    #respond_to do |format|
      #format.html
      #format.csv {render text: @incentivo.to_csv }
    #end
  	@search = IncentivoSearch.new(params[:search])
    @incentivo = @search.scope
    @incentivo = Incentivo.all

  end

  def show 
    authorize Incentivo
  end

  def new
  	@incentivo = Incentivo.new
    authorize @incentivo
  end

  def create
		@incentivo = Incentivo.new(incentivo_params)
		authorize @incentivo
		
	    if @incentivo.save

	    	redirect_to @incentivo	
	    else 
	    	render :action => "new"
	    end
	end

  def edit
  	authorize Incentivo
 	@incentivo = Incentivo.new
  end

  def find
  	
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

	def incentivo_params
		params.require(:incentivo).permit(:tipo_de_volumen , :valor_incentivo, :medio_id, :ordene_id, :rango, :escala, :pago_id)
	end
end
