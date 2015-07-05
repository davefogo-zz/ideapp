class SubcuentaPucsController < ApplicationController

	def index
		@subcuenta_puc = SubcuentaPuc.all
		
	end

	def new
		@subcuenta_puc = SubcuentaPuc.new
		
	end

	def create
		@subcuenta_puc = SubcuentaPuc.new(subcuenta_puc_params)
		
	    if @subcuenta_puc.save
	    	redirect_to action: 'index'	
	    else 
	    	render :action => "new"
	    end
	end

private

	def subcuenta_puc_params
		params.require(:subcuenta_puc).permit(:subcuenta, :descripcion, :cuenta)
	end

end