class ColaboradorePolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def index?
    @current_user.admin? or @current_user.contador?
  end

  def show?
    @current_user.admin? or @current_user.contador?
  end

  def update?
    @current_user.admin? or @current_user.contador?
  end

  def destroy?
    @current_user.admin? or @current_user.contador?
  end

end
