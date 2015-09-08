Rails.application.routes.draw do
  
  root to: 'visitors#index'
  resources :factura_items
  devise_for :users
  resources :users
  resources :facturas do
    collection { post :import }
  end
  resources :departamentos
  resources :clientes do
    collection { post :import }
  end
  resources :colaboradores do 
    collection { post :import }
  end
  resources :cargos
  get 'bienvenidos/index'
  resources :medios do 
    collection { post :import }
  end
  resources :proveedores do 
    collection { post :import }
  end
  resources :clases
  resources :grupos
  resources :cuenta_pucs
  resources :subcuenta_pucs do 
    collection { post :import }
  end
  resources :transaccions
  resources :volumenes
  resources :factura_proveedors do 
    collection { post :import }
  end
  resources :recibo_de_cajas do
    resources :recibo_items, controller: 'recibo_de_cajas/recibo_items'
  end
  resources :gastos do 
    collection { post :import }
  end 
  resources :pagos do 
    collection { post :import }
  end
  resources :activo_fijos do 
    collection { post :import }
  end
  resources :ajustes do
    collection { post :import }
    resources :transaccions, controller: 'ajustes/transaccions'
  end
  resources :presupuestos do
    collection { post :import }
    resources :ordenes, controller: 'presupuestos/ordenes'
  end
 

end
