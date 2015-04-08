Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :facturas
  get 'bienvenidos/index'
  resources :medios
  resources :proveedores
  resources :presupuestos do 
    resources :ordenes, except: [:index], controller: 'presupuestos/ordenes'
  end
  resources :clientes
  resources :colaboradores
end
