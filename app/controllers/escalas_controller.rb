class EscalasController < ApplicationController
	def index
		@escala = Escala.all
		authorize Escala
	end

	def show
		@escala = Escala.find(params[:id])
		authorize @escala
	end

	def new
		@escala = Escala.new
		authorize @escala
	end

	def edit
    	@escala = Escala.find(params[:id])
    	authorize @escala
  	end


	def create
		@escala = Escala.new(escala_params)
		authorize @escala
		
	    if @escala.save

	    	redirect_to @escala	
	    else 
	    	render :action => "new"
	    end
	end

	def update
    @escala = Escala.find(params[:id])
    authorize @escala
    respond_to do |format|
      if @escala.update(escala_params)
        format.html { redirect_to @escala, notice: 'Escala actualizada.' }
        format.json { render :show, status: :ok, location: @escala }
      else
        format.html { render :edit }
        format.json { render json: @escala.errors, status: :unprocessable_entity }
      end
    end
  end

private

	def escala_params
		params.require(:escala).permit(:escala, :escala2, :escala3, :escala4, :escala5)
	end
end
