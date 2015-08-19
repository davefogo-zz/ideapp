class FacturaSearch
  attr_reader :fecha_de_expedicion_from, :fecha_de_expedicion_to
  
  def initialize(params)
    params ||= {}
    @fecha_de_expedicion_from = parsed_fecha_de_expedicion(params[:fecha_de_expedicion_from], 7.days.ago.to_date.to_s)
    @fecha_de_expedicion_to = parsed_fecha_de_expedicion(params[:fecha_de_expedicion_to], Date.today.to_s)
  end
  
  def scope
    Factura.where('fecha_de_expedicion BETWEEN ? AND ?', @fecha_de_expedicion_from, @fecha_de_expedicion_to)
  end
  
  private
  
  def parsed_fecha_de_expedicion(fecha_de_expedicion_string, default)
    Date.parse(fecha_de_expedicion_string)
  rescue ArgumentError, TypeError
    default
  end
  
end