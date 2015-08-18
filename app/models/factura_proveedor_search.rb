class FacturaProveedorSearch
  attr_reader :fecha_vencimiento_from, :fecha_vencimiento_to
  
  def initialize(params)
    params ||= {}
    @fecha_vencimiento_from = parsed_fecha_vencimiento(params[:fecha_vencimiento_from], 7.days.ago.to_date.to_s)
    @fecha_vencimiento_to = parsed_fecha_vencimiento(params[:fecha_vencimiento_to], Date.today.to_s)
  end
  
  def scope
    FacturaProveedor.where('fecha_vencimiento BETWEEN ? AND ?', @fecha_vencimiento_from, @fecha_vencimiento_to)
  end
  
  private
  
  def parsed_fecha_vencimiento(fecha_vencimiento_string, default)
    Date.parse(fecha_vencimiento_string)
  rescue ArgumentError, TypeError
    default
  end
  
end