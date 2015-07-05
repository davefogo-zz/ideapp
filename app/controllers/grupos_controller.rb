class GruposController < ApplicationController

	def index
		@grupo = Grupo.all
		
	end

	def new
		@grupo = Grupo.new
		
	end

	def create
		@grupo = Grupo.new(grupo_params)
	
	    if @grupo.save
	    	redirect_to action: 'index'	
	    else 
	    	render :action => "new"
	    end
	end

private

	def grupo_params
		params.require(:grupo).permit(:grupo, :descripcion, :clase)
	end

end