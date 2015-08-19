class PresupuestoSearch
  attr_reader :fecha_from, :fecha_to
  
  def initialize(params)
    params ||= {}
    @fecha_from = parsed_fecha(params[:fecha_from], 7.days.ago.to_date.to_s)
    @fecha_to = parsed_fecha(params[:fecha_to], Date.today.to_s)
  end
  
  def scope
    Presupuesto.where('fecha BETWEEN ? AND ?', @fecha_from, @fecha_to)
  end
  
  private
  
  def parsed_fecha(fecha_string, default)
    Date.parse(fecha_string)
  rescue ArgumentError, TypeError
    default
  end
  
end