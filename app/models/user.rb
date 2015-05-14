class User < ActiveRecord::Base
  enum role: [:admin, :user, :gerente, :gerente_comercial, :gerente_digital, :gerente_financiero, :contador, :analista_recursoshumanos, :creativo, :ejecutivo, :analista_tesoreria, :analista_cartera, :recepcion_facturas, :analista_ordenacion, :analista_estudios]
  after_initialize :set_default_role, :if => :new_record?

   def set_default_role
    self.role ||= :user
   end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def name
    [first_name, last_name].compact.join(' ')
  end
end
