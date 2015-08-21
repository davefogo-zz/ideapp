class ActivoFijoSearch
  attr_reader :fecha_de_compra_from, :fecha_de_compra_to
  
  def initialize(params)
    params ||= {}
    @fecha_de_compra_from = parsed_fecha_de_compra(params[:fecha_de_compra_from], 7.days.ago.to_date.to_s)
    @fecha_de_compra_to = parsed_fecha_de_compra(params[:fecha_de_compra_to], Date.today.to_s)
  end
  
  def scope
    ActivoFijo.where('fecha_de_compra BETWEEN ? AND ?', @fecha_de_compra_from, @fecha_de_compra_to)
  end
  
  private
  
  def parsed_fecha_de_compra(fecha_de_compra_string, default)
    Date.parse(fecha_de_compra_string)
  rescue ArgumentError, TypeError
    default
  end
  
end