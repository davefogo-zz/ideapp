class CargosController < ApplicationController

	def index
		@cargo = Cargo.all
		@departamento = Departamento.all
	end

	def show
		@cargo = Cargo.find(params[:id])
		@departamento = Departamento.find(@cargo)
	end

	def new
		@cargo = Cargo.new
	end

	def create
		@cargo = Cargo.new(cargo_params)
	    if @cargo.save
	    	redirect_to @cargo	
	    else 
	    	render :action => "new"
	    end
	end

private

	def cargo_params
		params.require(:cargo).permit(:nombre, :departamento)
	end

end