FactoryGirl.define do
  factory :pago_item do
    pago nil
factura_proveedor nil
subcuenta_puc_id nil
importe 1
forma_de_pago "MyString"
gasto false
banco "MyString"
numero_de_cheque "MyString"
importe_pronto_pago 1
  end

end
