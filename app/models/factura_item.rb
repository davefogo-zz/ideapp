class FacturaItem < ActiveRecord::Base
  
  belongs_to :factura
  belongs_to :ordene

  def save
    self.subtotal = (costo_unidad * cantidad) - (costo_unidad * descuento);
    self.iva = (subtotal * 0.16);
    super   # calls the rails save function to store our object to the database
  end	

	
  after_save :generate_transaccion

  def generate_transaccion
  	Transaccion.create!(fecha: Time.now, credito: self.subtotal)
    Transaccion.create!(fecha: Time.now, debito: self.iva)
  end


  

  
end
