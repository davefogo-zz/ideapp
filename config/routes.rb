Rails.application.routes.draw do
  get 'transaccions/index'

  get 'transaccions/show'

  get 'transaccions/new'

  get 'transaccions/create'

  root to: 'visitors#index'
  resources :factura_items
  devise_for :users
  resources :users
  resources :facturas
  resources :departamentos
  resources :clientes
  resources :colaboradores
  resources :cargos
  get 'bienvenidos/index'
  resources :medios
  resources :proveedores
  resources :clases
  resources :grupos
  resources :cuenta_pucs
  resources :subcuenta_pucs
  resources :transaccions
  resources :presupuestos do 
    resources :ordenes, controller: 'presupuestos/ordenes'
  end
 

end
