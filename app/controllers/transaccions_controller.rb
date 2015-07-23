class TransaccionsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
  end

  private

	def transaccion_params
		params.require(:transaccion).permit(:fecha, :credito)
	end
end
