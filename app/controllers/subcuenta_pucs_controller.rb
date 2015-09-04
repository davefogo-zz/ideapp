class SubcuentaPucsController < ApplicationController

	def index
		respond_to do |format|
	      format.html
	      format.csv {render text: @subcuenta_pucs.to_csv }
	    end

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


  def import
    SubcuentaPuc.import(params[:file])
    redirect_to subcuenta_pucs_path, notice: 'Datos subidos.'
  end

private
	
	def set_subcuenta_puc
      @subcuenta_puc = SubcuentaPuc.find(params[:id])
    end

	def subcuenta_puc_params
		params.require(:subcuenta_puc).permit(:subcuenta, :descripcion, :cuenta)
	end

end