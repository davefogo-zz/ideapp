class FacturaProveedorPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def index?
    @current_user.admin? or @current_user.contador? or @current_user.analista_tesoreria? or @current_user.recepcion_facturas? 
  end

  def show?
    @current_user.admin? or @current_user.contador? or @current_user.analista_tesoreria? or @current_user.recepcion_facturas? 
  end

  def new?
    @current_user.admin? or @current_user.contador? or @current_user.analista_tesoreria? or @current_user.recepcion_facturas? 
  end

  def create?
    @current_user.admin? or @current_user.contador? or @current_user.analista_tesoreria? or @current_user.recepcion_facturas? 
  end

  def update?
    @current_user.admin? or @current_user.contador? or @current_user.analista_tesoreria? or @current_user.recepcion_facturas? 
  end

  def destroy?
    @current_user.admin? or @current_user.contador? or @current_user.analista_tesoreria? or @current_user.recepcion_facturas? 
  end

end
