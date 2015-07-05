class CuentaPucsController < ApplicationController

	def index
		@cuenta_puc = CuentaPuc.all
	
	end

	def new
		@cuenta_puc = CuentaPuc.new
		
	end

	def create
		@cuenta_puc = CuentaPuc.new(cuenta_puc_params)
		
	    if @cuenta_puc.save
	    	redirect_to action: 'index'		
	    else 
	    	render :action => "new"
	    end
	end

private

	def cuenta_puc_params
		params.require(:cuenta_puc).permit(:cuenta, :descripcion)
	end

end