class PresupuestoPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def index?
    @current_user.admin? or @current_user.contador? or @current_user.analista_ordenacion? or @current_user.gerente_comercial? or @current_user.gerente_digital? or @current_user.ejecutivo?
  end

  def show?
    @current_user.admin? or @current_user.contador? or @current_user.analista_ordenacion? or @current_user.gerente_comercial? or @current_user.gerente_digital? or @current_user.ejecutivo?
  end

  def new?
    @current_user.admin? or @current_user.contador? or @current_user.analista_ordenacion? or @current_user.gerente_comercial? or @current_user.gerente_digital? or @current_user.ejecutivo?
  end

  def edit?
    @current_user.admin? or @current_user.contador? or @current_user.analista_ordenacion? or @current_user.gerente_comercial? or @current_user.gerente_digital? or @current_user.ejecutivo?
  end

  def create?
    @current_user.admin? or @current_user.contador? or @current_user.analista_ordenacion? or @current_user.gerente_comercial? or @current_user.gerente_digital? or @current_user.ejecutivo?
  end

  def update?
    @current_user.admin? or @current_user.contador? or @current_user.analista_ordenacion? or @current_user.gerente_comercial? or @current_user.gerente_digital? or @current_user.ejecutivo?
  end

  def destroy?
    @current_user.admin? or @current_user.contador? or @current_user.analista_ordenacion? or @current_user.gerente_comercial? or @current_user.gerente_digital? or @current_user.ejecutivo?
  end

end
