class GruposController < ApplicationController

	def index
		@grupos = Grupo.all
		@clase = Clase.all
	end

	def new
		@grupo = Grupo.new
	end

	def create
		@grupo = Grupo.new(grupo_params)
		
		respond_to do |format|
		    if @grupo.save
		    	redirect_to action: 'index'	
		    else 
		    	render :action => "new"
		    end
		end
	end

	def import
		Grupo.import(params[:file])
	    redirect_to grupos_path, notice: 'Datos subidos.'
  	end

 private

	def set_grupo
      @grupo = Grupo.find(params[:id])
    end

	def grupo_params
		params.require(:grupo).permit(:grupo, :descripcion, :clase_id)
	end
end