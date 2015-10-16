class ClasesController < ApplicationController

	def index
		@clases = Clase.all
	end

	def new
		@clase = Clase.new
	end

	def edit
  	end

	def create
		@clase = Clase.new(clase_params)
		
	    if @clase.save
	    	redirect_to action: 'index'	
	    else 
	    	render :action => "new"
	    end
	end

  def import
    Clase.import(params[:file])
    redirect_to clases_path, notice: 'Datos subidos.'
  end

	def update
    respond_to do |format|
      authorize @subcuenta_puc
      if @clase.update(clase_params)
        format.html { redirect_to @clase, notice: 'Clase actualizada.' }
        format.json { render :show, status: :ok, location: @clase }
      else
        format.html { render :edit }
        format.json { render json: @clase.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @clase.destroy
    authorize @subcuenta_puc
    respond_to do |format|
      format.html { redirect_to clases_url, notice: 'Clase eliminada.' }
      format.json { head :no_content }
    end
  end

private

	 def set_clase
      @clase = Clase.find(params[:id])
    end

	def clase_params
		params.require(:clase).permit(:clase, :descripcion)
	end

end