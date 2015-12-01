class FacturaProveedorSearch
  attr_reader :fecha_recepcion_from, :fecha_recepcion_to
  
  def initialize(params)
    params ||= {}
    @fecha_recepcion_from = parsed_fecha_recepcion(params[:fecha_recepcion_from], 7.days.ago.to_date.to_s)
    @fecha_recepcion_to = parsed_fecha_recepcion(params[:fecha_recepcion_to], Date.today.to_s)
  end
  
  def scope
    FacturaProveedor.where('fecha_recepcion BETWEEN ? AND ?', @fecha_recepcion_from, @fecha_recepcion_to)
  end
  
  private
  
  def parsed_fecha_recepcion(fecha_recepcion_string, default)
    Date.parse(fecha_recepcion_string)
  rescue ArgumentError, TypeError
    default
  end
  
end