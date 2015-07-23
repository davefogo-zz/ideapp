class FacturaItem < ActiveRecord::Base
  
  belongs_to :factura
  belongs_to :ordene

  def save
    self.total = (costo_unidad * cantidad) - (costo_unidad * descuento);
    super   # calls the rails save function to store our object to the database
  end	

	
  after_save :generate_transaccion

  def generate_transaccion
  	Transaccion.create!(fecha: Time.now, credito: self.total)
  end


  

  
end
