class MedioPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def index?
    @current_user.admin? or @current_user.contador? or @current_user.analista_ordenacion?
  end

  def show?
    @current_user.admin? or @current_user.contador? or @current_user.analista_ordenacion?
  end

  def new?
    @current_user.admin? or @current_user.contador? or @current_user.analista_ordenacion?
  end

  def edit?
    @current_user.admin? or @current_user.contador? or @current_user.analista_ordenacion?
  end

  def create?
    @current_user.admin? or @current_user.contador? or @current_user.analista_ordenacion?
  end

  def update?
    @current_user.admin? or @current_user.contador? or @current_user.analista_ordenacion?
  end

  def destroy?
    @current_user.admin? or @current_user.contador? or @current_user.analista_ordenacion?
  end

  def import?
    @current_user.admin?
  end

end
