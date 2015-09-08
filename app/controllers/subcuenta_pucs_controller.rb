class SubcuentaPucsController < ApplicationController

	def index
		@subcuenta_pucs = SubcuentaPuc.all
		authorize SubcuentaPuc
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
		authorize @subcuenta_puc
	end

	def create
		@subcuenta_puc = SubcuentaPuc.new(subcuenta_puc_params)
		authorize @subcuenta_puc
	    if @subcuenta_puc.save
	    	redirect_to action: 'index'	
	    else 
	    	render :action => "new"
	    end
	end


  def import
    SubcuentaPuc.import(params[:file])
    authorize @subcuenta_puc
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