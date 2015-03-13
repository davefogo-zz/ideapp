Rails.application.routes.draw do
  resources :medios

  resources :proveedores

  resources :presupuestos do 
    resources :ordenes, except: [:index], controller: 'presupuestos/ordenes'
  end

  resources :clientes

  resources :colaboradores

  root to: 'welcome#index'
end
