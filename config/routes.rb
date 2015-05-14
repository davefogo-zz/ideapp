Rails.application.routes.draw do
  resources :factura_items
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :facturas
  resources :departamentos
  get 'bienvenidos/index'
  resources :medios
  resources :proveedores
  resources :presupuestos do 
    resources :ordenes, controller: 'presupuestos/ordenes'
  end
  resources :clientes
  resources :colaboradores

end
