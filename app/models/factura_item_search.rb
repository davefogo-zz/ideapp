class FacturaItemSearch
  attr_reader :fecha_orden_from, :fecha_orden_to
  
  def initialize(params)
    params ||= {}
    @fecha_orden_from = parsed_fecha_orden(params[:fecha_orden_from], 7.days.ago.to_date.to_s)
    @fecha_orden_to = parsed_fecha_orden(params[:fecha_orden_to], Date.today.to_s)
  end
  
  def scope
    FacturaItem.where('fecha_orden BETWEEN ? AND ?', @fecha_orden_from, @fecha_orden_to)
  end
  
  private
  
  def parsed_fecha_orden(fecha_orden_string, default)
    Date.parse(fecha_orden_string)
  rescue ArgumentError, TypeError
    default
  end
  
end