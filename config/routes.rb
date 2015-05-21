Rails.application.routes.draw do
  resources :factura_items
  root to: 'visitors#index'
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
  resources :presupuestos do 
    resources :ordenes, controller: 'presupuestos/ordenes'
  end
 

end
