class CargosController < ApplicationController

	def index
		@cargo = Cargo.all
		@departamento = Departamento.all
		authorize Cargo
	end

	def show
		@cargo = Cargo.find(params[:id])
		@departamento = @cargo.departamento
		authorize @cargo
	end

	def new
		@cargo = Cargo.new
		authorize @cargo
	end

	def create
		@cargo = Cargo.new(cargo_params)
		authorize @cargo
		
	    if @cargo.save

	    	redirect_to @cargo	
	    else 
	    	render :action => "new"
	    end
	end

private

	def cargo_params
		params.require(:cargo).permit(:nombre, :departamento_id)
	end

end