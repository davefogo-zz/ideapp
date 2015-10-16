class SubcuentaPucsController < ApplicationController

	def index
		authorize SubcuentaPuc
		cuenta_puc = CuentaPuc.all
		if params[:search] 
      		@subcuenta_pucs = SubcuentaPuc.search(params[:search])
    	else
      		@subcuenta_pucs = SubcuentaPuc.all
      	end
      	respond_to do |format|
	      format.html
	      format.csv {render text: @subcuenta_pucs.to_csv }
	    end
    end

    def show
    	@subcuenta_puc = SubcuentaPuc.find(params[:id])
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
  	authorize SubcuentaPuc
    SubcuentaPuc.import(params[:file])
    redirect_to subcuenta_pucs_path, notice: 'Datos subidos.'
  end

private
	
	def set_subcuenta_puc
      @subcuenta_puc = SubcuentaPuc.find(params[:id])
    end

	def subcuenta_puc_params
		params.require(:subcuenta_puc).permit(:subcuenta, :descripcion, :cuenta_puc_id)
	end

end