class VolumenesController < ApplicationController
  def index
  	@search = VolumenSearch.new(params[:search])
    @volumen = @search.scope
    @volumen = Volumen.all
  end

  def show
  end

  private

	def volumen_params
		params.require(:volumen).permit(:tipo_de_volumen, :valor_volumen, :medio_id, :ordene_id, :rango, :escala)
	end
end
