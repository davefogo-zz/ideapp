FactoryGirl.define do
  factory :gasto do
    fecha_recepcion "2015-08-13"
proveedore nil
importe 1
iva 1
autorizado_por nil
fecha_de_vencimiento "2015-08-13"
subcuenta_puc nil
asignar_a_cliente false
cliente nil
  end

end
