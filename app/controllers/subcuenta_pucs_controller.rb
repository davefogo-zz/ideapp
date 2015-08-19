class SubcuentaPucsController < ApplicationController

	def index
		@subcuenta_pucs = SubcuentaPuc.all
		if params[:search] 
      		@subcuenta_pucs = SubcuentaPuc.search(params[:search])
    	else
      		@subcuenta_pucs = SubcuentaPuc.all
      	end
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