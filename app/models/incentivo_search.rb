class IncentivoSearch
  attr_reader :created_at_from, :created_at_to
  
  def initialize(params)
    params ||= {}
    @created_at_from = parsed_created_at(params[:created_at_from], 7.days.ago.to_date.to_s)
    @created_at_to = parsed_created_at(params[:created_at_to], Date.today.to_s)
  end
  
  def scope
    Incentivo.where('created_at BETWEEN ? AND ?', @created_at_from, @created_at_to)
  end
  
  private
  
  def parsed_created_at(created_at_string, default)
    Date.parse(created_at_string)
  rescue ArgumentError, TypeError
    default
  end
  
end