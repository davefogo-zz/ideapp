class DepartamentosController < ApplicationController

	def index
		@departamento = Departamento.all
	end

	def new
		@departamento = Departamento.new
	end

	def create
		@departamento = Departamento.new(departamento_params)
	      
	    @departamento.save
	    
	      redirect_to @departamento
	end

	def show
		@departamento = Departamento.all
	end

private

	def departamento_params
		params.require(:departamento).permit(:nombre, :jefe)
	end

end