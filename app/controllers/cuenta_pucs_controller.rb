class CuentaPucsController < ApplicationController

	def index
		@cuenta_pucs = CuentaPuc.all
		respond_to do |format|
	      format.html
	      format.csv {render text: @cuenta_pucs.to_csv }
	    end
	end

	def new
		@cuenta_puc = CuentaPuc.new
	end

	def create
		@cuenta_puc = CuentaPuc.new(cuenta_puc_params)
		respond_to do |format|
		    if @cuenta_puc.save
		    	redirect_to action: 'index'		
		    else 
		    	render :action => "new"
		    end
		end
	end

	def import
    	CuentaPuc.import(params[:file])
    	redirect_to cuenta_pucs_path, notice: 'Datos subidos.'
 	 end

	private

	def cuenta_puc_params
		params.require(:cuenta_puc).permit(:cuenta, :descripcion, :grupo_id)
	end

end