class ClasesController < ApplicationController

	def index
		@clase = Clase.all
		
	end

	def new
		@clase = Clase.new
	
	end

	def create
		@clase = Clase.new(clase_params)
		
	    if @clase.save
	    	redirect_to action: 'index'	
	    else 
	    	render :action => "new"
	    end
	end

private

	def clase_params
		params.require(:clase).permit(:clase, :descripcion)
	end

end