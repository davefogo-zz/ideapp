class DepartamentosController < ApplicationController

	def index
		@departamento = Departamento.all
	end

	def show
		@departamento = Departamento.find(params[:id])
	end

	def new
		@departamento = Departamento.new
	end

	def create
		@departamento = Departamento.new(departamento_params)
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