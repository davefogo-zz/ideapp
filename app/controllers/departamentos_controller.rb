class DepartamentosController < ApplicationController

	def index
		@departamento = Departamento.all
		authorize Departamento
	end

	def show
		@departamento = Departamento.find(params[:id])
		authorize @departamento
	end

	def new
		@departamento = Departamento.new
		authorize @departamento
	end

	def create
		@departamento = Departamento.new(departamento_params)
		authorize @departamento
	    if @departamento.save
	    	redirect_to @departamento	
	    else 
	    	render :action => "new"
	    end
	end

private

	def departamento_params
		params.require(:departamento).permit(:nombre, :jefe)
	end

end