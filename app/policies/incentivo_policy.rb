class IncentivoPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def index?
    @current_user.admin? or @current_user.contador? or @current_user.analista_tesoreria? 
  end

  def show?
    @current_user.admin? or @current_user.contador? or @current_user.analista_tesoreria? 
  end

  def new?
    @current_user.admin? or @current_user.contador? or @current_user.analista_tesoreria? 
  end

  def edit?
    @current_user.admin? or @current_user.contador? or @current_user.analista_tesoreria? 
  end

  def create?
    @current_user.admin? or @current_user.contador? or @current_user.analista_tesoreria? 
  end

  def update?
    @current_user.admin? or @current_user.contador? or @current_user.analista_tesoreria? 
  end

  def destroy?
    @current_user.admin? or @current_user.contador? or @current_user.analista_tesoreria? 
  end

end
